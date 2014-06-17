/// \file
/// \brief Solve a non-stationary convection-diffusion-equation on a moving interface
/// \author LNM RWTH Aachen: Joerg Grande

/*
 * This file is part of DROPS.
 *
 * DROPS is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * DROPS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with DROPS. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 * Copyright 2009 LNM/SC RWTH Aachen, Germany
*/

#include "surfactant/ifacetransp.h"
#include "misc/params.h"
#include "geom/builder.h"
#include "levelset/levelset.h"
#include "levelset/adaptriang.h"
#include "levelset/surfacetension.h"
#include "levelset/levelsetmapper.h"
#include "out/output.h"
#include "out/vtkOut.h"
#include "misc/dynamicload.h"
#include "misc/funcmap.h"
#include "geom/subtriangulation.h"
#include "num/gradient_recovery.h"

#include <fstream>
#include <string>
#include <tr1/unordered_map>
#include <tr1/unordered_set>

using namespace DROPS;

DROPS::ParamCL P;

std::auto_ptr<VTKOutCL> vtkwriter;

DROPS::InVecMap& invecmap= DROPS::InVecMap::getInstance();
DROPS::InScaMap& inscamap= DROPS::InScaMap::getInstance();

instat_vector_fun_ptr the_wind_fun;
instat_scalar_fun_ptr the_lset_fun;
instat_scalar_fun_ptr the_rhs_fun;
instat_scalar_fun_ptr the_sol_fun;

typedef DROPS::Point3DCL (*bnd_val_fun) (const DROPS::Point3DCL&, double);

DROPS::BndCondT bc_wind[6]= { DROPS::DirBC, DROPS::DirBC, DROPS::DirBC, DROPS::DirBC, DROPS::DirBC, DROPS::DirBC };
bnd_val_fun bf_wind[6];

instat_scalar_fun_ptr sigma( 0);
SurfaceTensionCL sf( sigma, 0);
DROPS::LsetBndDataCL lsbnd( 6);


// Surface divergence of a vector field w
inline double div_gamma_wind (const Point3DCL& n, const SMatrixCL<3,3>& dw)
{
   return trace( dw) - inner_prod( n, dw*n);
}

// laplace-beltrami of a function u
inline double laplace_beltrami_u (const Point3DCL& n,      const SMatrixCL<3,3>& dn,
                                  const Point3DCL& grad_u, const SMatrixCL<3,3>& Hess_u)
{
     const double tr_PHessu= trace( Hess_u) - inner_prod( n, Hess_u*n),
                  tr_Pdn= trace( dn) - inner_prod( n, dn*n),
                  ngradu= inner_prod( n, grad_u);
     return tr_PHessu - tr_Pdn*ngradu;
}


DROPS::Point3DCL WindVelocity;
DROPS::Point3DCL constant_wind (const DROPS::Point3DCL&, double)
{
    return WindVelocity;
}
static RegisterVectorFunction regvec_constant_wind( "ConstantWind", constant_wind);

DROPS::Point3DCL RadDrop;
DROPS::Point3DCL PosDrop;
double ellipsoid (const DROPS::Point3DCL& p, double)
{
    const DROPS::Point3DCL x= (p - PosDrop)/RadDrop;
    return x.norm_sq() - 1.;
}
static RegisterScalarFunction regsca_ellipsoid_lset( "Ellipsoid", ellipsoid);


DROPS::Point2DCL RadTorus; // R= RadTorus[0], r= RadTorus[1]; R > r for tori with a hole.
double torus (const Point3DCL& p, double)
{
    return std::sqrt( std::pow( RadTorus[0] - std::sqrt(p[0]*p[0] + p[1]*p[1]), 2) + std::pow( p[2], 2)) - RadTorus[1];
}
static RegisterScalarFunction regsca_torus_lset( "Torus", torus);

// ==non-stationary test case "HeatConduction"
// "ConstantWind" 0
// "Ellipsoid" pos:[0,0,0], rad:[1,1,1]

double heat_conduction_u0 (const Point3DCL& p)
{
    return p[0]*p[1];
}

double heat_conduction_rhs (const Point3DCL&, double)
{
    return 0.;
}
static RegisterScalarFunction regsca_heat_conduction_rhs( "HeatConductionRhs", heat_conduction_rhs);

double heat_conduction_sol (const Point3DCL& p, double t)
{
    return std::exp( -6.*t)*heat_conduction_u0( p);
}
static RegisterScalarFunction regsca_heat_conduction_sol( "HeatConductionSol", heat_conduction_sol);


// ==non-stationary test-case "ToroidalFlow"==
// Level set: "torus" with RadTorus

double angular_velocity (const Point3DCL& p, double)
{
    return 1. + p[2];
}

DROPS::SMatrixCL<3,3> rotation_matrix (const DROPS::Point3DCL& p, double t)
{
    const double omega= angular_velocity( p, 0.);
    SMatrixCL<3,3> m;
    m(0,0)= std::cos(omega*t); m(0,1)= -std::sin(omega*t);
    m(1,0)= std::sin(omega*t); m(1,1)=  std::cos(omega*t);
    m(2,2)= 1.;
    return m;
}

DROPS::Point3DCL toroidal_flow (const DROPS::Point3DCL& p, double t)
{
    return rotation_matrix( p, t)*p;
}

DROPS::Point3DCL toroidal_flow_wind (const DROPS::Point3DCL& p, double)
{
    const double omega= angular_velocity( p, 0.);
    return MakePoint3D( -p[1]*omega, p[0]*omega, 0.);
}
static RegisterVectorFunction regvec_toroidal_flow_wind( "ToroidalFlowWind", toroidal_flow_wind);

double toroidal_flow_sol (const Point3DCL& p, double t)
{
    const Point3DCL q( toroidal_flow( p, -t));
    return std::exp( -t)*q[0]*q[1];
}
static RegisterScalarFunction regsca_toroidal_flow_sol( "ToroidalFlowSol", toroidal_flow_sol);

double toroidal_flow_rhs (const Point3DCL& p, double t)
{
    const Point3DCL w( toroidal_flow_wind( p, t));
    const double omega= angular_velocity( p, 0.);
    SMatrixCL<3,3> dw;
    dw(0,1)= -omega; dw(0,2)= -p[1];
    dw(1,0)=  omega; dw(1,2)=  p[0];

    const Point2DCL xhat( MakePoint2D( p[0], p[1]));
    const double norm_xhat= xhat.norm();
    const double l= torus( p, t) + RadTorus[1];
    const Point2DCL tt= (norm_xhat - RadTorus[0])/(l*norm_xhat)*xhat;
    const Point3DCL n( MakePoint3D( tt[0], tt[1], p[2]/l));
    SMatrixCL<3,3> dn;
    dn= eye<3,3>() - outer_product( n, n);
    SMatrixCL<2,2> dnhat= RadTorus[0]/norm_xhat*(eye<2,2>() - outer_product( xhat/norm_xhat, xhat/norm_xhat));
    dn(0,0)-= dnhat(0,0); dn(0,1)-= dnhat(0,1);
    dn(1,0)-= dnhat(1,0); dn(1,1)-= dnhat(1,1);
    dn*= 1./l;

    const double c= std::cos( omega*t),
                 s= std::sin( omega*t);
    const Point3DCL z( toroidal_flow( p, -t));
    const Point3DCL dz0( MakePoint3D(  c, s, t*(-s*p[0] + c*p[1]))),
                    dz1( MakePoint3D( -s, c, t*(-c*p[0] - s*p[1])));
    const Point3DCL grad_u= std::exp( -t)*(z[1]*dz0 + z[0]*dz1);
    SMatrixCL<3,3> Hess_u;
    Hess_u(0,2)= -c*z[0] - s*z[1];
    Hess_u(1,2)= -s*z[0] + c*z[1];
    Hess_u(2,0)= -c*z[0] - s*z[1];
    Hess_u(2,1)= -s*z[0] + c*z[1];
    Hess_u(2,2)= t*(z[0]*(s*p[0] - c*p[1]) + z[1]*(-c*p[0] - s*p[1]));
    Hess_u*= t;
    Hess_u+= outer_product( dz0, dz1) + outer_product( dz1, dz0);
    Hess_u*= std::exp( -t);

    const double u= toroidal_flow_sol( p, t),
                 mat_der=  -u,
                 reaction= div_gamma_wind( n, dw)*u,
                 diffusion= -laplace_beltrami_u( n, dn, grad_u, Hess_u);

    return mat_der + reaction + diffusion;
}
static RegisterScalarFunction regsca_toroidal_flow_rhs( "ToroidalFlowRhs", toroidal_flow_rhs);


// ==non-stationary test case "AxisScaling"==

double axis_scaling (double t)
{
    return 1. + 0.25*std::sin( t);
}

DROPS::Point3DCL axis_scaling_wind (const DROPS::Point3DCL& p, double t)
{
    return MakePoint3D( 0.25*std::cos( t)/axis_scaling( t)*p[0], 0., 0.);
}
static RegisterVectorFunction regvec_axis_scaling_wind( "AxisScalingWind", axis_scaling_wind);

double axis_scaling_lset (const Point3DCL& p, double t)
{
    return std::pow( p[0]/axis_scaling( t), 2) + std::pow( p[1], 2) + std::pow( p[2], 2) - 1.;
}
static RegisterScalarFunction regsca_axis_scaling_lset( "AxisScalingLset", axis_scaling_lset);

double axis_scaling_lset_ini (const Point3DCL& p, double)
{
    static const double t_end= P.get<Uint>( "Time.NumSteps")*P.get<double>( "Time.StepSize");
    const double tout= t_end <= M_PI/2. ? t_end : M_PI/2.,
                 tin= t_end >= M_PI*3./2. ? M_PI*3./2. : (t_end >= M_PI ? t_end : 0.),
                 lout= axis_scaling_lset( p, tout),
                 lin= axis_scaling_lset( p, tin);
    return lout >= 0. ? lout :
           lin  <= 0. ? lin  :
                        0.;
}

double axis_scaling_sol (const Point3DCL& p, double t)
{
    return std::exp( -0.5*t)*heat_conduction_u0( p);
}
static RegisterScalarFunction regsca_axis_scaling_sol( "AxisScalingSol", axis_scaling_sol);

double axis_scaling_rhs (const Point3DCL& p, double t)
{
    const double a= axis_scaling( t);
    const double bf4= (p/MakePoint3D( std::pow( a, 2), 1., 1.)).norm_sq();
    const double bf6= (p/MakePoint3D( std::pow( a, 3), 1., 1.)).norm_sq();

    const double mat_der=  0.25*std::cos( t)/a - 0.5;
    const double reaction= 0.25*std::cos( t)/a/bf4*( std::pow( p[1], 2) + std::pow( p[2], 2));
    const double diffusion= (-2./std::pow( a, 2) - (1. + 1./std::pow( a, 2))*( 2. + 1./std::pow( a, 2) - bf6/bf4))/bf4;

//     const Point3DCL tt( p/MakePoint3D( std::pow( a, 2), 1., 1.));
//     const double l= tt.norm();
//     const Point3DCL n( tt/l);
//     SMatrixCL<3,3> dn( (eye<3,3>() - outer_product( n, n))/l );
//     dn(0,0)/= std::pow( a, 2); dn(1,0)/= std::pow( a, 2); dn(2,0)/= std::pow( a, 2);
// 
//     const Point3DCL w( MakePoint3D( 0.25*p[0]*std::cos( t)/a, 0., 0.));
//     SMatrixCL<3,3> dw;
//     dw(0,0)= 0.25*std::cos( t)/a;
// 
//     const Point3DCL grad_u( std::exp( -0.5*t)*MakePoint3D( p[1], p[0], 0.));
//     SMatrixCL<3,3> Hess_u;
//     Hess_u(0,1)= 1.;
//     Hess_u(1,0)= 1.;
//     Hess_u*= std::exp( -0.5*t);
// 
//     const double err= div_gamma_wind( n, dw) - reaction,
//                errlb= laplace_beltrami_u( n, dn, grad_u, Hess_u) - diffusion*axis_scaling_sol( p, t);
//     if (std::fabs( err) > 1e-12 || std::fabs( errlb) > 1e-12) {
//         std::cerr << err   << " " << div_gamma_wind( n, dw) << " " << reaction << "\n"
//                   << errlb << " " << laplace_beltrami_u( n, dn, grad_u, Hess_u) << " " << diffusion*axis_scaling_sol( p, t) << "\n";
//         exit( 1);
//     }
//     return (mat_der + div_gamma_wind( n, dw))*axis_scaling_sol( p, t) - laplace_beltrami_u( n, dn, grad_u, Hess_u);

    return (mat_der + reaction - diffusion)*axis_scaling_sol( p, t);
}
static RegisterScalarFunction regsca_axis_scaling_rhs( "AxisScalingRhs", axis_scaling_rhs);


// ==non-stationary test case "Collision"==

const double collision_p= 3.0;

// sphere 1: c1= (-1.5 0 0) + v*t
Point3DCL collision_center_1 (double t)
{
    return MakePoint3D( -1.5, 0., 0.) + WindVelocity*t;
}
// sphere 2: c2= ( 1.5 0 0) - v*t = -c1
Point3DCL collision_center_2 (double t)
{
    return -collision_center_1( t);
}

double collision_Dt_lset (const DROPS::Point3DCL& x, double t)
{
    Point3DCL x1= x - collision_center_1( t),
              x2= x - collision_center_2( t);
    const double n1= x1.norm() < 1e-3 ? 1e-3 : std::pow( x1.norm(), collision_p + 2.),
                 n2= x2.norm() < 1e-3 ? 1e-3 : std::pow( x2.norm(), collision_p + 2.);
    return collision_p*(DROPS::inner_prod( WindVelocity, x1)/n1
                      - DROPS::inner_prod( WindVelocity, x2)/n2);
}

DROPS::Point3DCL collision_Dx_lset (const DROPS::Point3DCL& x, double t)
{
    Point3DCL x1= x - collision_center_1( t),
              x2= x - collision_center_2( t);
    const double n1= x1.norm() < 1e-3 ? 1e-3 : std::pow( x1.norm(), collision_p + 2.),
                 n2= x2.norm() < 1e-3 ? 1e-3 : std::pow( x2.norm(), collision_p + 2.);
    return collision_p*(x1/n1 + x2/n2);
}

DROPS::Point3DCL collision_wind (const DROPS::Point3DCL& x, double t)
{
    const Point3DCL Dphi= collision_Dx_lset( x, t);
    const double Dtphi=   collision_Dt_lset( x, t);
    const double n= Dphi.norm_sq();
    return n < 1e-6 ? DROPS::Point3DCL() : (Dtphi/n)*Dphi;
}
static RegisterVectorFunction regvec_collision_wind( "CollisionWind", collision_wind);

double collision_lset (const Point3DCL& x, double t)
{
    const Point3DCL c1= collision_center_1( t);
    const Point3DCL x1= x - c1;
    const Point3DCL c2= collision_center_2( t);
    const Point3DCL x2= x - c2;

    const double n1= x1.norm() < 1e-3 ? 1e-3 : std::pow( x1.norm(), collision_p),
                 n2= x2.norm() < 1e-3 ? 1e-3 : std::pow( x2.norm(), collision_p);
    return RadDrop[0] - 1./n1  - 1./n2;
}
static RegisterScalarFunction regsca_collision_lset( "CollisionLset", collision_lset);

double collision_sol (const Point3DCL& x, double)
{
    return 2.*std::cos( x[0])*std::cos(M_PI*x[1]);
}
static RegisterScalarFunction regsca_collision_sol( "CollisionSol", collision_sol);

double collision_sol2 (const Point3DCL& x, double)
{
    return x[0] < 0. ? 0 : 3. - x[0];
}
static RegisterScalarFunction regsca_collision_sol2( "CollisionSol2", collision_sol2);

double collision_rhs (const Point3DCL&, double)
{
    return 0;
}
static RegisterScalarFunction regsca_collision_rhs( "CollisionRhs", collision_rhs);


// ==Some spheres==

double sphere_dist (const DROPS::Point3DCL& p, double)
{
    DROPS::Point3DCL x( p - PosDrop);
    return x.norm() - RadDrop[0];
}
static RegisterScalarFunction regsca_sphere_dist_lset( "SphereDist", sphere_dist);


typedef double (*dist_funT) (const DROPS::Point3DCL&, double);

double sphere_2move (const DROPS::Point3DCL& p, double t)
{
    DROPS::Point3DCL x( p - (PosDrop + t*constant_wind(p, t)));
    return x.norm() - RadDrop[0];
}

SMatrixCL<3,3> dp_sphere (const DROPS::Point3DCL& x, double)
{
    const double normx= x.norm();
    return normx == 0. ? SMatrixCL<3,3>() : RadDrop[0]/normx*(eye<3,3>() - outer_product( x/normx, x/normx));
}

// ==stationary test case "LaplaceBeltrami0"==
// Sphere around 0, RadDrop 1, wind == 0
// A right hand side from C.J. Heine...
// const double a( -13./8.*std::sqrt( 35./M_PI));
const double a( 12.);
double laplace_beltrami_0_rhs (const DROPS::Point3DCL& p, double)
{
    return a/std::pow( p.norm(), 3.)*(3.*p[0]*p[0]*p[1] - p[1]*p[1]*p[1]);
}
static RegisterScalarFunction regsca_laplace_beltrami_0_rhs( "LaplaceBeltrami0Rhs", laplace_beltrami_0_rhs);

// ...and the corresponding solution (extended)
double laplace_beltrami_0_sol (const DROPS::Point3DCL& p, double)
{
//     return p.norm_sq()/(12. + p.norm_sq())*laplace_beltrami_0_rhs( p, 0.);
    return 1./12.*laplace_beltrami_0_rhs( p, 0.);
//    return 1. + p.norm_sq()/(12. + p.norm_sq())*laplace_beltrami_0_rhs( p, 0.);
}
static RegisterScalarFunction regsca_laplace_beltrami_0_sol( "LaplaceBeltrami0Sol", laplace_beltrami_0_sol);


double sol0t (const DROPS::Point3DCL& p, double t)
{
    const Point3DCL q( p - (PosDrop + t*constant_wind(p, t)));
    const double val( a*(3.*q[0]*q[0]*q[1] - q[1]*q[1]*q[1]));

//    return q.norm_sq()/(12. + q.norm_sq())*val;
    return 1. + q.norm_sq()/(12. + q.norm_sq())*val;
}


template<class DiscP1FunType>
double L2_error (const DROPS::VecDescCL& ls, const BndDataCL<>& lsbnd,
    const DiscP1FunType& discsol, DROPS::instat_scalar_fun_ptr extsol)
{
    const PrincipalLatticeCL& lat= PrincipalLatticeCL::instance( 2);
    const double t= discsol.GetTime();
    QuadDomain2DCL qdom;
    std::valarray<double> qsol,
                          qdiscsol;

    double d( 0.);
    DROPS_FOR_TRIANG_CONST_TETRA( discsol.GetMG(), ls.GetLevel(), it) {
        make_CompositeQuad5Domain2D (qdom, *it, lat, ls, lsbnd);
        resize_and_evaluate_on_vertexes ( discsol, *it, qdom, qdiscsol);
        resize_and_evaluate_on_vertexes ( extsol,  *it, qdom, t, qsol);
        d+= quad_2D( std::pow( qdiscsol - qsol, 2), qdom);
    }
    return std::sqrt( d);
}

/// The nodal interpolant of extsol on the interface-FE-space ist computed first.
/// The H1-error is then computed between the interpolant and the numerical solution.
template<class DiscP1FunType>
double H1_error (const DROPS::VecDescCL& ls, const BndDataCL<>& lsbnd,
    const DiscP1FunType& discsol, DROPS::instat_scalar_fun_ptr extsol)
{
    IdxDescCL* idx= const_cast<IdxDescCL*>( discsol.GetSolution()->RowIdx);
    MatDescCL A( idx, idx);
    SetupLBP1( discsol.GetMG(), &A, ls, lsbnd, 1.);
    VecDescCL sol_vec( idx);
    P1Init (extsol, sol_vec, discsol.GetMG(), discsol.GetTime());
    // sol_vec.t= discsol.GetTime();
    // SetupInterfaceRhsP1( discsol.GetMG(), &sol_vec, ls, lsbnd, extsol);
    const VectorCL diff( discsol.GetSolution()->Data - sol_vec.Data);
    return std::sqrt( dot(A.Data*diff, diff));
}

double L2_norm (const DROPS::MultiGridCL& mg, const DROPS::VecDescCL& ls, const BndDataCL<>& lsbnd,
    DROPS::instat_scalar_fun_ptr extsol)
{
    const PrincipalLatticeCL& lat= PrincipalLatticeCL::instance( 2);
    const double t= ls.t;
    QuadDomain2DCL qdom;
    std::valarray<double> qsol;

    double d( 0.);
    DROPS_FOR_TRIANG_CONST_TETRA( mg, ls.GetLevel(), it) {
        make_CompositeQuad5Domain2D (qdom, *it, lat, ls, lsbnd);
        resize_and_evaluate_on_vertexes ( extsol,  *it, qdom, t, qsol);
        d+= quad_2D( qsol*qsol, qdom);
    }
    return std::sqrt( d);
}

void LinearLSInit (const DROPS::MultiGridCL& mg, DROPS::VecDescCL& ls, DROPS::instat_scalar_fun_ptr d, double t= 0.)
{
    const DROPS::Uint lvl= ls.GetLevel(),
                      idx= ls.RowIdx->GetIdx();

    DROPS_FOR_TRIANG_CONST_VERTEX( mg, lvl, it)
        ls.Data[it->Unknowns( idx)]= d( it->GetCoord(), t);

    DROPS_FOR_TRIANG_CONST_EDGE( mg, lvl, it)
        ls.Data[it->Unknowns( idx)]= ls.Data[it->Unknowns( idx)]=
            0.5*(ls.Data[it->GetVertex( 0)->Unknowns( idx)] + ls.Data[it->GetVertex( 1)->Unknowns( idx)]);
    ls.t= t;
}

void LSInit (const DROPS::MultiGridCL& mg, DROPS::VecDescCL& ls, dist_funT d, double t= 0.)
{
    const DROPS::Uint lvl= ls.GetLevel(),
                      idx= ls.RowIdx->GetIdx();

    DROPS_FOR_TRIANG_CONST_VERTEX( mg, lvl, it)
        ls.Data[it->Unknowns( idx)]= d( it->GetCoord(), t);

    DROPS_FOR_TRIANG_CONST_EDGE( mg, lvl, it)
        ls.Data[it->Unknowns( idx)]= d( 0.5*(it->GetVertex( 0)->GetCoord() + it->GetVertex( 1)->GetCoord()), t);
    ls.t= t;
}

void InitVel ( const MultiGridCL& mg, VecDescCL* vec, BndDataCL<Point3DCL>& Bnd, instat_vector_fun_ptr LsgVel, double t= 0.)
{
    VectorCL& lsgvel= vec->Data;
    const Uint lvl  = vec->GetLevel(),
               vidx = vec->RowIdx->GetIdx();

    DROPS_FOR_TRIANG_CONST_VERTEX( mg, lvl, sit) {
        if (!Bnd.IsOnDirBnd( *sit))
            DoFHelperCL<Point3DCL, VectorCL>::set( lsgvel, sit->Unknowns( vidx),
                LsgVel(sit->GetCoord(), t));
    }
    DROPS_FOR_TRIANG_CONST_EDGE( mg, lvl, sit) {
        if (!Bnd.IsOnDirBnd( *sit))
            DoFHelperCL<Point3DCL, VectorCL>::set( lsgvel, sit->Unknowns( vidx),
                LsgVel( (sit->GetVertex(0)->GetCoord() + sit->GetVertex(1)->GetCoord())/2., t));
    }
    vec->t= t;
}


SurfactantP1BaseCL* make_surfactant_timedisc( MultiGridCL& mg, LevelsetP2CL& lset,
                                              VecDescCL& v, const BndDataCL<Point3DCL>& Bnd_v,
                                              const ParamCL& P)
{
    SurfactantP1BaseCL* ret= 0;
    const std::string method= P.get<std::string>( "SurfTransp.Method");

    if (method == std::string( "cGcG"))
        ret= new SurfactantcGP1CL( mg,
            P.get<double>("SurfTransp.Theta"), P.get<double>("SurfTransp.Visc"),
            &v, Bnd_v, lset.Phi, lset.GetBndData(),
            P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"),
            P.get<double>("SurfTransp.OmitBound"));
    else if (method == std::string( "spacetime-cGdG"))
        ret= new SurfactantSTP1CL( mg,
            P.get<double>("SurfTransp.Theta"), P.get<double>("SurfTransp.Visc"),
            &v, Bnd_v, lset.Phi, lset.GetBndData(),
            /* cG_in_t_ */ false, /* use_mass_div */ P.get<bool>( "SurfTransp.UseMassDiv"),
            P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"),
            P.get<double>("SurfTransp.OmitBound"));
    else if (method == std::string( "spacetime-cGcG"))
        ret= new SurfactantSTP1CL( mg,
            P.get<double>("SurfTransp.Theta"), P.get<double>("SurfTransp.Visc"),
            &v, Bnd_v, lset.Phi, lset.GetBndData(),
            /* cG_in_t_ */ true, /* use_mass_div */ P.get<bool>( "SurfTransp.UseMassDiv"),
            P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"),
            P.get<double>("SurfTransp.OmitBound"));
    else if (method == std::string( "characteristic-transport"))
        ret= new SurfactantCharTransportP1CL ( mg,
            P.get<double>("SurfTransp.Theta"), P.get<double>("SurfTransp.Visc"),
            &v, Bnd_v, lset.Phi, lset.GetBndData(),
            P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"),
            P.get<double>("SurfTransp.OmitBound"));
    else
        throw DROPSErrCL( std::string( "make_surfactant_timedisc: Unknown method '") + method + std::string( "'.\n"));

    return ret;
}


void Strategy (DROPS::MultiGridCL& mg, DROPS::AdapTriangCL& adap, DROPS::LevelsetP2CL& lset)
{
    using namespace DROPS;

    if (P.get<std::string>("Exp.Levelset") == std::string( "AxisScalingLset"))
        adap.MakeInitialTriang( axis_scaling_lset_ini);
    else
        adap.MakeInitialTriang( the_lset_fun);

    lset.CreateNumbering( mg.GetLastLevel(), &lset.idx);
    lset.Phi.SetIdx( &lset.idx);
    // LinearLSInit( mg, lset.Phi, the_lset_fun, 0.);
    LSInit( mg, lset.Phi, the_lset_fun, 0.);

    //DROPS::LevelsetP2CL& lset2( *LevelsetP2CL::Create( mg, lsbnd, sf, P.get_child("Levelset")) );
    //lset2.idx.CreateNumbering( mg.GetLastLevel(), mg);
    //lset2.Phi.SetIdx( &lset2.idx);
    //LSInit( mg, lset2.Phi, the_lset_fun, 0.);

    const double Vol= lset.GetVolume();
    std::cout << "droplet volume: " << Vol << std::endl;

    BndDataCL<Point3DCL> Bnd_v( 6, bc_wind, bf_wind);
    IdxDescCL vidx( vecP2_FE);
    vidx.CreateNumbering( mg.GetLastLevel(), mg, Bnd_v);
    VecDescCL v( &vidx);
    InitVel( mg, &v, Bnd_v, the_wind_fun, 0.);

    //lset2.SetupSystem( make_P2Eval( mg, Bnd_v, v), P.get<double>("Time.StepSize"));

    std::auto_ptr<SurfactantP1BaseCL> timediscp( make_surfactant_timedisc( mg, lset, v, Bnd_v, P));
    SurfactantP1BaseCL& timedisc= *timediscp;
    timedisc.SetRhs( the_rhs_fun);

    LevelsetRepairCL lsetrepair( lset);
    adap.push_back( &lsetrepair);
    InterfaceP1RepairCL ic_repair( mg, lset.Phi, lset.GetBndData(), timedisc.ic);
    adap.push_back( &ic_repair);
    //LevelsetRepairCL lset2repair( lset2);
    //adap.push_back( &lset2repair);

    // Init Interface-Sol
    timedisc.idx.CreateNumbering( mg.GetLastLevel(), mg, &lset.Phi, &lset.GetBndData());
    std::cout << "NumUnknowns: " << timedisc.idx.NumUnknowns() << std::endl;
    timedisc.ic.SetIdx( &timedisc.idx);
    timedisc.SetInitialValue( the_sol_fun, 0.);

    BndDataCL<> nobnd( 0);
    VecDescCL the_sol_vd( &lset.idx);
    LSInit( mg, the_sol_vd, the_sol_fun, /*t*/ 0.);
    if (vtkwriter.get() != 0) {
        vtkwriter->Register( make_VTKScalar(      lset.GetSolution(),              "Levelset") );
        vtkwriter->Register( make_VTKIfaceScalar( mg, timedisc.ic,                 "InterfaceSol"));
        vtkwriter->Register( make_VTKVector(      make_P2Eval( mg, Bnd_v, v),      "Velocity"));
        //vtkwriter->Register( make_VTKScalar(      lset2.GetSolution(),             "Levelset2"));
        vtkwriter->Register( make_VTKScalar(      make_P2Eval( mg, nobnd, the_sol_vd),  "TrueSol"));
        vtkwriter->Write( 0.);
    }
    //if (P.get<int>( "SolutionOutput.Freq") > 0)
    //    DROPS::WriteFEToFile( timedisc.ic, mg, P.get<std::string>( "SolutionOutput.Path"), P.get<bool>( "SolutionOutput.Binary"));

    const double dt= P.get<double>("Time.StepSize");
    double L_2x_err= L2_error( lset.Phi, lset.GetBndData(), timedisc.GetSolution(), the_sol_fun);
    std::cout << "L_2x-error: " << L_2x_err
              << "\nnorm of true solution: " << L2_norm( mg, lset.Phi, lset.GetBndData(), the_sol_fun)
              << std::endl;
    double L_inftL_2x_err= L_2x_err;
    std::cout << "L_inftL_2x-error: " <<  L_inftL_2x_err << std::endl;
    double H_1x_err= H1_error( lset.Phi, lset.GetBndData(), timedisc.GetSolution(), the_sol_fun);
    std::cout << "H_1x-error: " << H_1x_err << std::endl;
    double L_2tH_1x_err_sq= 0.5*dt*std::pow( H_1x_err, 2);
    BndDataCL<> ifbnd( 0);
    std::cout << "initial surfactant on \\Gamma: " << Integral_Gamma( mg, lset.Phi, lset.GetBndData(), make_P1Eval(  mg, ifbnd, timedisc.ic)) << '\n';

    for (int step= 1; step <= P.get<int>("Time.NumSteps"); ++step) {
        std::cout << "======================================================== step " << step << ":\n";
        ScopeTimerCL timer( "Strategy: Time-loop");
        const double cur_time= step*dt;
        // Assumes (as the rest of Drops), that the current triangulation is acceptable to perform the time-step.
        // If dt is large and AdapRef.Width is small, this may not be true.
        // Watch for large differences in numbers of old and new dof.
        timedisc.InitTimeStep();
        LSInit( mg, lset.Phi, the_lset_fun, cur_time);
        InitVel( mg, &v, Bnd_v, the_wind_fun, cur_time);
        timedisc.DoStep( cur_time);
        std::cout << "surfactant on \\Gamma: " << Integral_Gamma( mg, lset.Phi, lset.GetBndData(), make_P1Eval(  mg, ifbnd, timedisc.ic)) << '\n';
        L_2x_err= L2_error( lset.Phi, lset.GetBndData(), timedisc.GetSolution(), the_sol_fun);
        std::cout << "L_2x-error: " << L_2x_err
                  << "\nnorm of true solution: " << L2_norm( mg, lset.Phi, lset.GetBndData(), the_sol_fun)
                  << std::endl;
        L_inftL_2x_err= std::max( L_inftL_2x_err, L_2x_err);
        std::cout << "L_inftL_2x-error: " << L_inftL_2x_err << std::endl;
        L_2tH_1x_err_sq+= (step > 1 ? 0.5 : 0.)*dt*std::pow( H_1x_err, 2);
        H_1x_err= H1_error( lset.Phi, lset.GetBndData(), timedisc.GetSolution(), the_sol_fun);
        std::cout << "H_1x-error: " << H_1x_err << std::endl;
        L_2tH_1x_err_sq+= 0.5*dt*std::pow( H_1x_err, 2);
        std::cout << "L_2tH_1x-error: " << std::sqrt( L_2tH_1x_err_sq) << std::endl;
        if (vtkwriter.get() != 0 && step % P.get<int>( "VTK.VTKOut") == 0) {
            LSInit( mg, the_sol_vd, the_sol_fun, /*t*/ cur_time);
            vtkwriter->Write( cur_time);
        }
        if (P.get<int>( "SolutionOutput.Freq") > 0 && step % P.get<int>( "SolutionOutput.Freq") == 0) {
            std::ostringstream os1,
                               os2;
            os1 << P.get<int>( "Time.NumSteps");
            os2 << P.get<std::string>( "SolutionOutput.Path") << std::setw( os1.str().size()) << step;
            DROPS::WriteFEToFile( timedisc.ic, mg, os2.str(), P.get<bool>( "SolutionOutput.Binary"));
        }
//        lset2.DoStep();
//        VectorCL rhs( lset2.Phi.Data.size());
//        lset2.ComputeRhs( rhs);
//        lset2.SetupSystem( make_P2Eval( mg, Bnd_v, v, cur_time));
//        lset2.SetTimeStep( P.get<double>("Time.StepSize"));
//        lset2.DoStep( rhs);

//         std::cout << "rel. Volume: " << lset.GetVolume()/Vol << std::endl;
//         if (P.get("Levelset.VolCorr", 0)) {
//             double dphi= lset.AdjustVolume( Vol, 1e-9);
//             std::cout << "volume correction is " << dphi << std::endl;
//             lset.Phi.Data+= dphi;
//             std::cout << "new rel. Volume: " << lset.GetVolume()/Vol << std::endl;
//         }
        //if (C.rpm_Freq && step%C.rpm_Freq==0) { // reparam levelset function
            // lset.ReparamFastMarching( C.rpm_Method);
        const bool doGridMod= P.get<int>("AdaptRef.Freq") && step%P.get<int>("AdaptRef.Freq") == 0;
        const bool gridChanged= doGridMod ? adap.UpdateTriang( lset) : false;
        if (gridChanged) {
            std::cout << "Triangulation changed.\n";
            vidx.DeleteNumbering( mg);
            vidx.CreateNumbering( mg.GetLastLevel(), mg, Bnd_v);
            v.SetIdx( &vidx);
            InitVel( mg, &v, Bnd_v, the_wind_fun, cur_time);
            LSInit( mg, lset.Phi, the_lset_fun, cur_time);
            the_sol_vd.SetIdx( &lset.idx);
            LSInit( mg, the_sol_vd, the_sol_fun, /*t*/ cur_time);
            // timedisc.Update(); // Called unconditionally in DoStep.

            //lset2.SetupSystem( make_P2Eval( mg, Bnd_v, v), P.get<double>("Time.StepSize"));

            std::cout << "rel. Volume: " << lset.GetVolume()/Vol << std::endl;
            if (P.get<int>( "Levelset.VolCorr")) {
                double dphi= lset.AdjustVolume( Vol, 1e-9);
                std::cout << "volume correction is " << dphi << std::endl;
                lset.Phi.Data+= dphi;
                std::cout << "new rel. Volume: " << lset.GetVolume()/Vol << std::endl;
            }
        }
    }
    std::cout << std::endl;
    //delete &lset2;
}

void StationaryStrategy (DROPS::MultiGridCL& mg, DROPS::AdapTriangCL& adap, DROPS::LevelsetP2CL& lset)
{
    adap.MakeInitialTriang( sphere_dist);

    lset.CreateNumbering( mg.GetLastLevel(), &lset.idx);
    lset.Phi.SetIdx( &lset.idx);
    // LinearLSInit( mg, lset.Phi, &sphere_dist);
    LSInit( mg, lset.Phi, sphere_dist, 0.);

    DROPS::IdxDescCL ifaceidx( P1IF_FE);
    ifaceidx.GetXidx().SetBound( P.get<double>("SurfTransp.OmitBound"));
    ifaceidx.CreateNumbering( mg.GetLastLevel(), mg, &lset.Phi, &lset.GetBndData());
    std::cout << "NumUnknowns: " << ifaceidx.NumUnknowns() << std::endl;

    DROPS::MatDescCL M( &ifaceidx, &ifaceidx);
    DROPS::SetupInterfaceMassP1( mg, &M, lset.Phi, lset.GetBndData());
    std::cout << "M is set up.\n";
    DROPS::MatDescCL A( &ifaceidx, &ifaceidx);
    DROPS::SetupLBP1( mg, &A, lset.Phi, lset.GetBndData(), P.get<double>("SurfTransp.Visc"));
    DROPS::MatrixCL L;
    L.LinComb( 1.0, A.Data, 1.0, M.Data);
    DROPS::VecDescCL b( &ifaceidx);
    DROPS::SetupInterfaceRhsP1( mg, &b, lset.Phi, lset.GetBndData(), laplace_beltrami_0_rhs);

    //DROPS::WriteToFile( M.Data, "m_iface.txt", "M");
    //DROPS::WriteToFile( A.Data, "a_iface.txt", "A");
    //DROPS::WriteFEToFile( b, mg, "rhs_iface.txt", /*binary=*/ true);

    typedef DROPS::SSORPcCL SurfPcT;
    SurfPcT surfpc;
    typedef DROPS::PCGSolverCL<SurfPcT> SurfSolverT;
    SurfSolverT surfsolver( surfpc, P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"), true);

    DROPS::VecDescCL x( &ifaceidx);
    surfsolver.Solve( L, x.Data, b.Data, x.RowIdx->GetEx());
    std::cout << "Iter: " << surfsolver.GetIter() << "\tres: " << surfsolver.GetResid() << '\n';

    if (P.get<int>( "SolutionOutput.Freq") > 0)
        DROPS::WriteFEToFile( x, mg, P.get<std::string>( "SolutionOutput.Path"), P.get<bool>( "SolutionOutput.Binary"));

    DROPS::IdxDescCL ifacefullidx( DROPS::P1_FE);
    ifacefullidx.CreateNumbering( mg.GetLastLevel(), mg);
    DROPS::VecDescCL xext( &ifacefullidx);
    DROPS::Extend( mg, x, xext);
    DROPS::NoBndDataCL<> nobnd;
    if (vtkwriter.get() != 0) {
        vtkwriter->Register( make_VTKScalar( lset.GetSolution(), "Levelset") );
        vtkwriter->Register( make_VTKIfaceScalar( mg, x, "InterfaceSol"));
        vtkwriter->Write( 0.);
    }

    double L2_err( L2_error( lset.Phi, lset.GetBndData(), make_P1Eval( mg, nobnd, xext), &laplace_beltrami_0_sol));
    std::cout << "L_2-error: " << L2_err << std::endl;
}

typedef std::tr1::unordered_set<const TetraCL*> TetraSetT;
typedef std::tr1::unordered_map<const VertexCL*, TetraSetT> VertexToTetrasT;

/// Computes a map from the vertices at the pcw. linear interface to all tetras that contain the vertex.
/// XXX Use a PrincipalLatticeCL!
void compute_vertex_neighborhoods (const DROPS::MultiGridCL& mg, DROPS::LevelsetP2CL& lset, VertexToTetrasT& vertex_neighborhood)
{
    vertex_neighborhood.clear();

    LocalP2CL<> locls;
    DROPS_FOR_TRIANG_CONST_TETRA( mg, lset.Phi.GetLevel(), it) {
        locls.assign( *it, lset.Phi, lset.GetBndData());
        if (equal_signs( locls)) continue;

        for (Uint i= 0; i < 4; ++i)
            vertex_neighborhood[it->GetVertex( i)].insert( &*it);
    }
}

typedef std::tr1::unordered_map<const TetraCL*, TetraSetT> TetraToTetrasT;

/// XXX Use a PrincipalLatticeCL!
void compute_tetra_neighborhoods (const DROPS::MultiGridCL& mg, DROPS::LevelsetP2CL& lset, TetraToTetrasT& tetra_neighborhoods)
{
    VertexToTetrasT vertex_neighborhoods;

    LocalP2CL<> locls;
    DROPS_FOR_TRIANG_CONST_TETRA( mg, lset.Phi.GetLevel(), it) {
        locls.assign( *it, lset.Phi, lset.GetBndData());
        if (equal_signs( locls)) continue;

        tetra_neighborhoods[&*it]; // insert it with an empty set of neighbors.
        for (Uint i= 0; i < 4; ++i)
            vertex_neighborhoods[it->GetVertex( i)].insert( &*it);
    }
    for (TetraToTetrasT::iterator it= tetra_neighborhoods.begin(); it != tetra_neighborhoods.end(); ++it) {
        const TetraCL& tet= *it->first;
        for (Uint v= 0; v < 4; ++v) {
            const TetraSetT& tset= vertex_neighborhoods[tet.GetVertex( v)];
            it->second.insert( tset.begin(), tset.end());
        }
    }
}


// Return a tetra from neighborhood that contains v up to precision eps in barycentric coordinates.
// Returns 0 on failure.
void enclosing_tetra (const Point3DCL& v, const TetraSetT& neighborhood, double eps, const TetraCL*& tetra, BaryCoordCL& bary)
{
    World2BaryCoordCL w2b;
    for (TetraSetT::const_iterator tit = neighborhood.begin(); tit != neighborhood.end(); ++tit) {
        w2b.assign( **tit);
        bary= w2b( v);
        if (is_in_ref_tetra( bary, eps)) {
            tetra= *tit;
            return;
        }
    }
    tetra= 0;
}

double abs_det_sphere (const TetraCL& tet, const BaryCoordCL& xb, const SurfacePatchCL& p)
{
    if (p.empty())
        return 0.;

    // Compute the jacobian of p.
    SMatrixCL<3,3> dp= dp_sphere( GetWorldCoord( tet, xb), 0.);

    const Bary2WorldCoordCL b2w( tet);
    QRDecompCL<3,2> qr;
    SMatrixCL<3,2>& M= qr.GetMatrix();
    M.col(0, b2w( p.vertex_begin()[1]) - b2w( p.vertex_begin()[0]));
    M.col(1, b2w( p.vertex_begin()[2]) - b2w( p.vertex_begin()[0]));
    qr.prepare_solve();
    SMatrixCL<3,2> U;
    Point3DCL tmp;
    for (Uint i= 0; i < 2; ++i) {
        tmp= std_basis<3>( i + 1);
        qr.apply_Q( tmp);
        U.col( i, tmp);
    }
    const SMatrixCL<2,2> Gram= GramMatrix( dp*U);
    return std::sqrt( Gram(0,0)*Gram(1,1) - Gram(0,1)*Gram(1,0));
}

// Computes W from La. 5.1. The transformation of the gradient requires W^{-1}.
void gradient_trafo (const TetraCL& tet, const BaryCoordCL& xb, const QuaQuaMapperCL& quaqua, const SurfacePatchCL& p, SMatrixCL<3,3>& W)
{
    // Compute the basepoint b.
    const TetraCL* btet= &tet;
    BaryCoordCL b= xb;
    quaqua.base_point( btet, b);

    // nl(x)
    p.compute_normals( tet);
    Point3DCL nl= p.normal_begin()[0];
    // Evaluate the normal to the interface in b, n(y).
    Point3DCL n= quaqua.local_ls_grad( *btet, b);
    n/= n.norm();

    // Dp_h(x)^T
    SMatrixCL<3,3> dph, dphT;
    quaqua.jacobian( tet, xb, dph);
    assign_transpose( dphT, dph);

    W= dphT + outer_product( nl, n/inner_prod( nl, n) - dph*nl);
}

typedef std::vector<std::pair<const TetraCL*, BaryCoordCL> > BaryPosVectorT;

class InterfaceCommonDataCL : public TetraAccumulatorCL
{
  private:
    InterfaceCommonDataCL** the_clones;

    const VecDescCL*   ls;      // P2-level-set
    const BndDataCL<>* lsetbnd; // boundary data for the level set function
    LocalP2CL<> locp2_ls;

    VecDescCL* to_iface; // For all P2-dofs x: p_h(x) - x.

    double max_dph_err,
           surfacemeasP1,
           surfacemeasP2,
           max_absdet_err,
           max_dph2_err;

    bool do_compute_debug_data_;

    // Compute test-data for the recovered gradient and QuaQuaMapperCL.
    // This is only correct for 1 OpenMP-Thread due to update races.
    void compute_debug_data (const TetraCL& t) {
//         std::cout << "Tetra Id: " << t.GetId().GetIdent() << std::endl;
        const TetraCL* tet;
        BaryCoordCL b;
        for (SurfacePatchCL::const_vertex_iterator it= surf.vertex_begin(); it != surf.vertex_end(); ++it) {
            tet= &t;
            b= *it;
            quaqua.base_point( tet, b);
            const Point3DCL& x= GetWorldCoord( t, *it);
//             const Point3DCL& xb= GetWorldCoord( *tet, b);
//             std::cout  << "    |x-xb|: " << (x - xb).norm();

            SMatrixCL<3,3> dph;
            quaqua.jacobian( t, *it, dph);
            SMatrixCL<3,3> diff_dp= dph - dp_sphere( x, 0.);
            const double dph_err= std::sqrt( frobenius_norm_sq( diff_dp));
            max_dph_err= std::max( max_dph_err, dph_err);
//             std::cout  << " |dph -dp|_F: " << dph_err;

            const double absdet= abs_det( t, *it, quaqua, surf),
                         absdet_err= std::abs( absdet - abs_det_sphere( t, *it, surf));
            max_absdet_err= std::max( max_absdet_err, absdet_err);
//             std::cout  << " |\\mu - \\mu^s|: " << absdet_err << std::endl;


            Point3DCL n=x/x.norm();
            SMatrixCL<3,3> diff_dp2= diff_dp - outer_product( n, transp_mul( diff_dp, n));
            Point3DCL nh;
            Point3DCL v1= GetWorldCoord( t, surf.vertex_begin()[1]) - GetWorldCoord( t, surf.vertex_begin()[0]),
                      v2= GetWorldCoord( t, surf.vertex_begin()[2]) - GetWorldCoord( t,surf.vertex_begin()[0]);
            cross_product( nh, v1, v2);
            nh/= nh.norm();
            diff_dp2= diff_dp2 - outer_product( diff_dp2*nh, nh);
            const double dph2_err= std::sqrt( frobenius_norm_sq( diff_dp2));
//             std::cout  << " |P(dph -dp)\\hat P|_F: " << dph2_err << std::endl;
            max_dph2_err= std::max( max_dph2_err, dph2_err);
        }
        surfacemeasP1+= quad_2D( std::valarray<double>( 1., qdom.vertex_size()), qdom);
        surfacemeasP2+= quad_2D( absdet, qdom);

    }

  public:
    const PrincipalLatticeCL& lat;
    LocalP2CL<> p2[10];
    LocalP1CL<Point3DCL> gradrefp2[10];

    std::valarray<double> ls_loc;
    SurfacePatchCL surf;
    QuadDomain2DCL qdom;

    BaryPosVectorT qdom_projected;

    std::valarray<double> absdet;

    QuaQuaMapperCL quaqua;

    const InterfaceCommonDataCL& get_clone () const {
        const int tid= omp_get_thread_num();
        return tid == 0 ? *this : the_clones[tid][0];
    }

    bool empty () const { return surf.empty(); }

    void store_offsets( VecDescCL& to_ifacearg) { to_iface= &to_ifacearg; }

    InterfaceCommonDataCL (const VecDescCL& ls_arg, const BndDataCL<>& lsetbnd_arg, const QuaQuaMapperCL& quaquaarg, bool do_compute_debug_data= false)
        : ls( &ls_arg), lsetbnd( &lsetbnd_arg), to_iface( 0), do_compute_debug_data_( do_compute_debug_data),
          lat( PrincipalLatticeCL::instance( 1)), ls_loc( lat.vertex_size()), quaqua( quaquaarg) {
        P2DiscCL::GetGradientsOnRef( gradrefp2);
        for (Uint i= 0; i < 10 ; ++i)
            p2[i][i]= 1.; // P2-Basis-Functions
    }

    virtual ~InterfaceCommonDataCL () {}

    virtual void begin_accumulation   () {
        the_clones= new InterfaceCommonDataCL*[omp_get_max_threads()];
        the_clones[0]= this;

        max_dph_err= 0;
        surfacemeasP1= 0.;
        surfacemeasP2= 0.;
        max_absdet_err= 0.;
        max_dph2_err= 0;
    }
    virtual void finalize_accumulation() {
        delete[] the_clones;

        if (do_compute_debug_data_ == true) {
            const double surface_true= 4.*M_PI*RadDrop[0]*RadDrop[0];
            std::cout << "max_dph_err: " << max_dph_err
                << "\nsurfacemeasP1: " << surfacemeasP1 << " rel. error: " << std::abs(surfacemeasP1 - surface_true)/surface_true
                << "\nsurfacemeasP2: " << surfacemeasP2 << " rel. error: " << std::abs(surfacemeasP2 - surface_true)/surface_true
                << "\nmax_absdet_err: " << max_absdet_err
                << "\nmax_dph2_err: " << max_dph2_err << std::endl;
        }
    }

    virtual void visit (const TetraCL& t) {
        surf.clear();
        locp2_ls.assign( t, *ls, *lsetbnd);
        evaluate_on_vertexes( locp2_ls, lat, Addr( ls_loc));
        if (equal_signs( ls_loc))
            return;
        surf.make_patch<MergeCutPolicyCL>( lat, ls_loc);
        if (surf.empty())
            return;

        make_CompositeQuad5Domain2D ( qdom, surf, t);
        qdom_projected.clear();
        qdom_projected.reserve( qdom.vertex_size());
        const TetraCL* tet;
        BaryCoordCL b;
        for (QuadDomain2DCL::const_vertex_iterator v= qdom.vertex_begin(); v != qdom.vertex_end(); ++v) {
            tet= &t;
            b= *v;
            quaqua.base_point( tet, b);
            qdom_projected.push_back( std::make_pair( tet, b));
        }

        absdet.resize( qdom.vertex_size());
        for (Uint i= 0; i < qdom.vertex_size(); ++i) {
            absdet[i]= abs_det( t, qdom.vertex_begin()[i], quaqua, surf);
        }

        if (to_iface != 0) {
            const Uint sys= to_iface->RowIdx->GetIdx();
            for (Uint i= 0; i < 4; ++i) {
                tet= &t;
                b= BaryCoordCL();
                b[i]= 1.;
                quaqua.base_point( tet, b);
                Point3DCL offset= t.GetVertex( i)->GetCoord() - GetWorldCoord( *tet, b);
                const size_t dof= t.GetVertex( i)->Unknowns( sys);
                std::copy( Addr( offset), Addr( offset) + 3, &to_iface->Data[dof]);
            }
        }

        if (do_compute_debug_data_ == true)
            compute_debug_data( t);
    }

    virtual InterfaceCommonDataCL* clone (int clone_id) {
        return the_clones[clone_id]= new InterfaceCommonDataCL( *this);
    }
};

template <class LocalMatrixT>
class InterfaceMatrixAccuP2CL : public TetraAccumulatorCL
{
  private:
    const InterfaceCommonDataCL& cdata_;
    std::string name_;

    MatDescCL* mat_; // the matrix
    MatrixBuilderCL* M;

    LocalMatrixT local_mat;

    Uint lvl;
    IdxT numr[10],
         numc[10];

  public:
    InterfaceMatrixAccuP2CL (MatDescCL* Mmat, const LocalMatrixT& loc_mat, const InterfaceCommonDataCL& cdata,
                             std::string name= std::string())
        : cdata_( cdata), name_( name), mat_( Mmat), M( 0), local_mat( loc_mat) {}
    virtual ~InterfaceMatrixAccuP2CL () {}

    void set_name (const std::string& n) { name_= n; }

    virtual void begin_accumulation () {
        const IdxT num_rows= mat_->RowIdx->NumUnknowns();
        const IdxT num_cols= mat_->ColIdx->NumUnknowns();
        std::cout << "InterfaceMatrixAccuP2CL::begin_accumulation";
        if (name_ != std::string())
            std::cout << " for \"" << name_ << "\"";
        std::cout  << ": " << num_rows << " rows, " << num_cols << " cols.\n";
        lvl = mat_->GetRowLevel();
        M= new MatrixBuilderCL( &mat_->Data, num_rows, num_cols);
    }

    virtual void finalize_accumulation () {
        M->Build();
        delete M;
        M= 0;
        std::cout << "InterfaceMatrixAccuP2CL::finalize_accumulation";
        if (name_ != std::string())
            std::cout << " for \"" << name_ << "\"";
        std::cout << ": " << mat_->Data.num_nonzeros() << " nonzeros." << std::endl;
    }

    virtual void visit (const TetraCL& t) {
        const InterfaceCommonDataCL& cdata= cdata_.get_clone();
        if (cdata.empty())
            return;
        local_mat.setup( t, cdata);
        GetLocalNumbP2NoBnd( numr, t, *mat_->RowIdx);
        GetLocalNumbP2NoBnd( numc, t, *mat_->ColIdx);
        update_global_matrix_P2( *M, local_mat.coup, numr, numc);
    }

    virtual InterfaceMatrixAccuP2CL* clone (int /*clone_id*/) { return new InterfaceMatrixAccuP2CL( *this); }
};

class LocalLaplaceBeltramiP2CL
{
  private:
    double D_; // diffusion coefficient

    LocalP1CL<Point3DCL> gradp2[10];
    GridFunctionCL<Point3DCL> qgradp2[10];

    GridFunctionCL<Point3DCL> nl;
    GridFunctionCL<SMatrixCL<3,3> > Winv;

  public:
    double coup[10][10];

    void setup (const TetraCL& t, const InterfaceCommonDataCL& cdata) {
        if (cdata.surf.normal_empty())
            cdata.surf.compute_normals( t);
        resize_and_scatter_piecewise_normal( cdata.surf, cdata.qdom, nl);

        Winv.resize( cdata.qdom.vertex_size());
        QRDecompCL<3,3> qr;
        SVectorCL<3> tmp;
        for (Uint i= 0; i < cdata.qdom.vertex_size(); ++i) {
            gradient_trafo( t, cdata.qdom.vertex_begin()[i], cdata.quaqua, cdata.surf, qr.GetMatrix());
            qr.prepare_solve();
            for (Uint j= 0; j < 3; ++j) {
                tmp= std_basis<3>( j + 1);
                qr.Solve( tmp);
                Winv[i].col( j, tmp);
            }
        }

        double dummy;
        SMatrixCL<3,3> T;
        GetTrafoTr( T, dummy, t);
        P2DiscCL::GetGradients( gradp2, cdata.gradrefp2, T);
        for (int i= 0; i < 10; ++i) {
            resize_and_evaluate_on_vertexes ( gradp2[i], cdata.qdom, qgradp2[i]);
            for (Uint j= 0; j < qgradp2[i].size(); ++j) {
                tmp=  qgradp2[i][j] - inner_prod( nl[j], qgradp2[i][j])*nl[j];
                qgradp2[i][j]= Winv[j]*tmp;
            }
        }

        for (int i= 0; i < 10; ++i) {
            coup[i][i]= quad_2D( cdata.absdet*dot( qgradp2[i], qgradp2[i]), cdata.qdom);
            for(int j= 0; j < i; ++j)
                coup[i][j]= coup[j][i]= quad_2D( cdata.absdet*dot( qgradp2[j], qgradp2[i]), cdata.qdom);
        }
    }

    LocalLaplaceBeltramiP2CL (double D)
        :D_( D) {}
};

class LocalMassP2CL
{
  private:
    std::valarray<double> qp2[10];

  public:
    double coup[10][10];

    void setup (const TetraCL&, const InterfaceCommonDataCL& cdata) {
        for (int i= 0; i < 10; ++i)
            resize_and_evaluate_on_vertexes ( cdata.p2[i], cdata.qdom, qp2[i]);

        for (int i= 0; i < 10; ++i) {
            coup[i][i]= quad_2D( cdata.absdet*qp2[i]*qp2[i], cdata.qdom);
            for(int j= 0; j < i; ++j)
                coup[i][j]= coup[j][i]= quad_2D( cdata.absdet*qp2[j]*qp2[i], cdata.qdom);
        }
    }

    LocalMassP2CL () {}
};

/// \brief Accumulate an interface-vector.
template <class LocalVectorT>
class InterfaceVectorAccuP2CL : public TetraAccumulatorCL
{
  private:
    const InterfaceCommonDataCL& cdata_;
    std::string name_;

    VecDescCL* y_;
    LocalVectorT local_vec;
    IdxT numry[10];

  public:
    InterfaceVectorAccuP2CL (VecDescCL* y, const LocalVectorT& loc_vec, const InterfaceCommonDataCL& cdata, std::string name= std::string())
        : cdata_( cdata), name_( name), y_( y), local_vec( loc_vec) {}
    virtual ~InterfaceVectorAccuP2CL () {}

    void set_name (const std::string& n) { name_= n; }

    virtual void begin_accumulation () {
        std::cout << "InterfaceVectorAccuP2CL::begin_accumulation";
        if (name_ != std::string())
            std::cout << " for \"" << name_ << "\"";
        std::cout  << ": " << y_->RowIdx->NumUnknowns() << " rows.\n";
    }

    virtual void finalize_accumulation() {}

    virtual void visit (const TetraCL& t) {
        const InterfaceCommonDataCL& cdata= cdata_.get_clone();
        if (cdata.empty())
            return;
        GetLocalNumbP2NoBnd( numry, t, *y_->RowIdx);
        local_vec.setup( t, cdata, numry);
        for (int i= 0; i < 10; ++i)
            if (numry[i] != NoIdx)
                y_->Data[numry[i]]+= local_vec.vec[i];
    }

    virtual InterfaceVectorAccuP2CL* clone (int /*clone_id*/) { return new InterfaceVectorAccuP2CL( *this); }
};

template <class T, class ResultIterT>
  inline ResultIterT
  evaluate_on_vertexes (T (*f)(const Point3DCL&, double), const BaryPosVectorT& pos, double t, ResultIterT result_iterator)
{
    for (Uint i= 0; i < pos.size(); ++i) {
        const std::pair<const TetraCL*, BaryCoordCL>& p= pos[i];
        const BaryEvalCL<> eval( *p.first, t, f);
        *result_iterator++= eval( p.second);
    }
    return result_iterator;
}

template <class T, class ResultContT>
  inline ResultContT&
  resize_and_evaluate_on_vertexes (T (*f)(const Point3DCL&, double), const BaryPosVectorT& pos, double t, ResultContT& result_container)
{
    result_container.resize( pos.size());
    evaluate_on_vertexes( f, pos, t, sequence_begin( result_container));
    return result_container;
}

template <class PEvalT, class ResultIterT>
  inline ResultIterT
  evaluate_on_vertexes (const PEvalT& f, const BaryPosVectorT& pos, ResultIterT result_iterator)
{
    for (Uint i= 0; i < pos.size(); ++i) {
        const std::pair<const TetraCL*, BaryCoordCL>& p= pos[i];
        typename PEvalT::LocalFET loc_f( *p.first, f);
        *result_iterator++= loc_f( p.second);
    }
    return result_iterator;
}

template <class PEvalT, class ResultContT>
  inline ResultContT&
  resize_and_evaluate_on_vertexes (const PEvalT& f, const BaryPosVectorT& pos, ResultContT& result_container)
{
    result_container.resize( pos.size());
    evaluate_on_vertexes( f, pos, sequence_begin( result_container));
    return result_container;
}

/// \brief Compute the load-vector corresponding to the function f on a single tetra.
class LocalVectorP2CL
{
  private:
    instat_scalar_fun_ptr f_;
    double time_;

    std::valarray<double> qp2,
                          qf;

  public:
    double vec[10];

    LocalVectorP2CL (instat_scalar_fun_ptr f, double time) : f_( f), time_( time) {}

    void setup (const TetraCL&, const InterfaceCommonDataCL& cdata, const IdxT numr[10]) {
//         resize_and_evaluate_on_vertexes( f_, t, cdata.qdom, time_, qf);
        resize_and_evaluate_on_vertexes( f_, cdata.qdom_projected, time_, qf);
//         qf.resize( cdata.qdom_projected.size());
//         for (Uint i= 0; i < cdata.qdom_projected.size(); ++i) {
//             const std::pair<const TetraCL*, BaryCoordCL>& pos= cdata.qdom_projected[i];
//             BaryEvalCL<> feval( *pos.first, time_, f_);
//             qf[i]= feval( pos.second);
//         }
        qp2.resize( cdata.qdom.vertex_size());
        for (Uint i= 0; i < 10; ++i) {
                if (numr[i] == NoIdx)
                    continue;
                evaluate_on_vertexes( cdata.p2[i], cdata.qdom, Addr( qp2));
                vec[i]= quad_2D( cdata.absdet*qf*qp2, cdata.qdom);
        }
    }
};


/// \brief Accumulate L2-norms and errors on the higher order zero level.
/// Works for P1IF_FE, P2IF_FE, and C-functions. All functions are evaluated on the P2-levelset.
class InterfaceL2AccuP2CL : public TetraAccumulatorCL
{
  private:
    const InterfaceCommonDataCL& cdata_;
    const MultiGridCL& mg;
    std::string name_;

    NoBndDataCL<> nobnddata;
    const VecDescCL* fvd;

    instat_scalar_fun_ptr f;
    double f_time;

    double f_grid_norm,
           f_norm,
           err;
    double f_grid_int,
           f_int,
           area;

  public:
    InterfaceL2AccuP2CL (const InterfaceCommonDataCL& cdata, const MultiGridCL& mg_arg, std::string name= std::string())
        : cdata_( cdata), mg( mg_arg), name_( name), fvd( 0), f( 0), f_time( 0.) {}
    virtual ~InterfaceL2AccuP2CL () {}

    void set_name (const std::string& n) { name_= n; }
    void set_grid_function (const VecDescCL& fvdarg) { fvd= &fvdarg; }
    void set_function (const instat_scalar_fun_ptr farg, double f_time_arg= 0.) {
        f= farg;
        f_time= f_time_arg;
    }

    virtual void begin_accumulation () {
        std::cout << "InterfaceL2AccuP2CL::begin_accumulation";
        if (name_ != std::string())
            std::cout << " for \"" << name_ << "\".\n";
        f_grid_norm= f_norm= err= 0.;
        f_grid_int= f_int= area= 0.;
    }

    virtual void finalize_accumulation() {
        std::cout << "InterfaceL2AccuP2CL::finalize_accumulation";
        if (name_ != std::string())
            std::cout << " for \"" << name_ << "\":";
        std::cout << "\n\tarea: " << area;
        if (fvd != 0) {
            f_grid_norm= std::sqrt( f_grid_norm);
            std::cout << "\n\t|| f_grid ||_L2: " << f_grid_norm
                      << "\tintegral: " << f_grid_int;
        }
        if (f != 0) {
            f_norm= std::sqrt( f_norm);
            std::cout << "\n\t|| f ||_L2: " << f_norm
                      << "\t integral: " << f_int;
        }
        if (fvd != 0 && f != 0) {
            err= std::sqrt( err);
            std::cout << "\n\t|| f - f_grid ||_L2: " << err;
            const double mvf_err= std::sqrt( std::pow( err, 2) - std::pow( f_grid_int - f_int, 2)/area);
            std:: cout << "\t|| f - c_f - (f_grid -c_{f_grid}) ||_L2: " << mvf_err;
        }
        std::cout << std::endl;
    }

    virtual void visit (const TetraCL& t) {
        const InterfaceCommonDataCL& cdata= cdata_.get_clone();
        if (cdata.empty())
            return;

        area+= quad_2D( cdata.absdet, cdata.qdom);

        std::valarray<double> qfgrid,
                              qf;
        if (fvd != 0) {
            // XXX: Check, whether incomplete P2-Data exists locally (which is allowed for P2IF_FE, but not handled correctly by this class --> Extend fvd). Likewise for P1IF_FE...
            if (fvd->RowIdx->GetFE() == P2IF_FE)
                resize_and_evaluate_on_vertexes( make_P2Eval( mg, nobnddata, *fvd), t, cdata.qdom, qfgrid);
            else if (fvd->RowIdx->GetFE() == P1IF_FE)
                resize_and_evaluate_on_vertexes( make_P1Eval( mg, nobnddata, *fvd), t, cdata.qdom, qfgrid);
//             resize_and_evaluate_on_vertexes( make_P2Eval( mg, nobnddata, *fvd), cdata.qdom_projected, qfgrid);
            f_grid_int+= quad_2D( cdata.absdet*qfgrid, cdata.qdom);
            f_grid_norm+= quad_2D( cdata.absdet*qfgrid*qfgrid, cdata.qdom);
        }
        if (f != 0) {
            resize_and_evaluate_on_vertexes( f, cdata.qdom_projected, f_time, qf);
            f_int+= quad_2D( cdata.absdet*qf, cdata.qdom);
            f_norm+= quad_2D( cdata.absdet*qf*qf, cdata.qdom);
        }
        if (fvd != 0 && f != 0) {
            std::valarray<double> qerr= qfgrid - qf;
            err+= quad_2D( cdata.absdet*qerr*qerr, cdata.qdom);
        }
    }

    virtual InterfaceL2AccuP2CL* clone (int /*clone_id*/) { return new InterfaceL2AccuP2CL( *this); }
};

void StationaryStrategyHighOrder (DROPS::MultiGridCL& mg, DROPS::AdapTriangCL& adap, DROPS::LevelsetP2CL& lset)
{
    // Initialize level set and triangulation
    adap.MakeInitialTriang( sphere_dist);

    lset.CreateNumbering( mg.GetLastLevel(), &lset.idx);
    lset.Phi.SetIdx( &lset.idx);
    // LinearLSInit( mg, lset.Phi, &sphere_dist);
    LSInit( mg, lset.Phi, sphere_dist, 0.);

    // Setup an interface-P1 numbering
    DROPS::IdxDescCL ifaceidx( P1IF_FE);
    ifaceidx.GetXidx().SetBound( P.get<double>("SurfTransp.OmitBound"));
    ifaceidx.CreateNumbering( mg.GetLastLevel(), mg, &lset.Phi, &lset.GetBndData());
    std::cout << "NumUnknowns: " << ifaceidx.NumUnknowns() << std::endl;

    // Setup an interface-P2 numbering
    DROPS::IdxDescCL ifacep2idx( P2IF_FE);
    ifacep2idx.GetXidx().SetBound( P.get<double>("SurfTransp.OmitBound"));
    ifacep2idx.CreateNumbering( mg.GetLastLevel(), mg, &lset.Phi, &lset.GetBndData());
    std::cout << "P2-NumUnknowns: " << ifacep2idx.NumUnknowns() << std::endl;

    // Recover the gradient of the level set function
    IdxDescCL vecp2idx( vecP2_FE);
    vecp2idx.CreateNumbering( mg.GetLastLevel(), mg);
    VecDescCL lsgradrec( &vecp2idx);
    averaging_P2_gradient_recovery( mg, lset.Phi, lset.GetBndData(), lsgradrec);

    // Compute neighborhoods of the tetras at the interface
    TetraToTetrasT tetra_neighborhoods;
    compute_tetra_neighborhoods( mg, lset, tetra_neighborhoods);

    QuaQuaMapperCL quaqua( mg, lset.Phi, lsgradrec, tetra_neighborhoods);

    VecDescCL to_iface( &vecp2idx);
//     {
//     TetraAccumulatorTupleCL accus;
//     InterfaceCommonDataCL ttt( lset.Phi, lset.GetBndData(), quaqua);
// //     ttt.store_offsets( to_iface);
//     accus.push_back( &ttt);
//     accumulate( accus, mg, ifaceidx.TriangLevel(), ifaceidx.GetMatchingFunction(), ifaceidx.GetBndInfo());
//     }

    TetraAccumulatorTupleCL accus;
    InterfaceCommonDataP1CL cdata( lset.Phi, lset.GetBndData());
    accus.push_back( &cdata);
    DROPS::MatDescCL M( &ifaceidx, &ifaceidx);
    InterfaceMatrixAccuP1CL<LocalInterfaceMassP1CL> accuM( &M, LocalInterfaceMassP1CL(), cdata, "M");
    accus.push_back( &accuM);
    DROPS::MatDescCL A( &ifaceidx, &ifaceidx);
    InterfaceMatrixAccuP1CL<LocalLaplaceBeltramiP1CL> accuA( &A, LocalLaplaceBeltramiP1CL( P.get<double>("SurfTransp.Visc")), cdata, "A");
    accus.push_back( &accuA);

    InterfaceCommonDataCL cdatap2( lset.Phi, lset.GetBndData(), quaqua);
    accus.push_back( &cdatap2);
    DROPS::MatDescCL Mp2( &ifacep2idx, &ifacep2idx);
    InterfaceMatrixAccuP2CL<LocalMassP2CL> accuMp2( &Mp2, LocalMassP2CL(), cdatap2, "Mp2");
    accus.push_back( &accuMp2);
    DROPS::MatDescCL Ap2( &ifacep2idx, &ifacep2idx);
    InterfaceMatrixAccuP2CL<LocalLaplaceBeltramiP2CL> accuAp2( &Ap2, LocalLaplaceBeltramiP2CL( P.get<double>("SurfTransp.Visc")), cdatap2, "Ap2");
    accus.push_back( &accuAp2);
    DROPS::VecDescCL bp2( &ifacep2idx);
    InterfaceVectorAccuP2CL<LocalVectorP2CL> acculoadp2( &bp2, LocalVectorP2CL( laplace_beltrami_0_rhs, bp2.t), cdatap2);
    accus.push_back( &acculoadp2);

    accumulate( accus, mg, ifaceidx.TriangLevel(), ifaceidx.GetMatchingFunction(), ifaceidx.GetBndInfo());

//     DROPS::MatrixCL L;
//     L.LinComb( 1.0, A.Data, 1.0, M.Data);
    MatrixCL& L= A.Data;
//     DROPS::MatrixCL Lp2;
//     Lp2.LinComb( 1.0, Ap2.Data, 1.0, Mp2.Data);
    MatrixCL& Lp2= Ap2.Data;

    DROPS::VecDescCL b( &ifaceidx);
    DROPS::SetupInterfaceRhsP1( mg, &b, lset.Phi, lset.GetBndData(), laplace_beltrami_0_rhs);

    DROPS::WriteToFile( M.Data, "m_iface.txt", "M");
    DROPS::WriteToFile( A.Data, "a_iface.txt", "A");
    DROPS::WriteFEToFile( b, mg, "rhs_iface.txt", /*binary=*/ false);
    DROPS::WriteToFile( Ap2.Data, "ap2_iface.txt", "Ap2");
    DROPS::WriteToFile( Mp2.Data, "mp2_iface.txt", "Mp2");
    DROPS::WriteFEToFile( bp2, mg, "rhsp2_iface.txt", /*binary=*/ false);

    typedef DROPS::SSORPcCL SurfPcT;
    SurfPcT surfpc;
    typedef DROPS::PCGSolverCL<SurfPcT> SurfSolverT;
    SurfSolverT surfsolver( surfpc, P.get<int>("SurfTransp.Iter"), P.get<double>("SurfTransp.Tol"), true);

    DROPS::VecDescCL x( &ifaceidx);
    surfsolver.Solve( L, x.Data, b.Data, x.RowIdx->GetEx());
    std::cout << "Iter: " << surfsolver.GetIter() << "\tres: " << surfsolver.GetResid() << '\n';

    DROPS::VecDescCL xp2( &ifacep2idx);
    surfsolver.Solve( Lp2, xp2.Data, bp2.Data, xp2.RowIdx->GetEx());
    std::cout << "P2: Iter: " << surfsolver.GetIter() << "\tres: " << surfsolver.GetResid() << '\n';

    TetraAccumulatorTupleCL err_accus;
    err_accus.push_back( &cdatap2);
    InterfaceL2AccuP2CL L2P1_accu( cdatap2, mg, "P1-solution");
    L2P1_accu.set_grid_function( x);
    L2P1_accu.set_function( &laplace_beltrami_0_sol, 0.);
    err_accus.push_back( &L2P1_accu);
    InterfaceL2AccuP2CL L2_accu( cdatap2, mg, "P2-solution");
    L2_accu.set_grid_function( xp2);
    L2_accu.set_function( &laplace_beltrami_0_sol, 0.);
    err_accus.push_back( &L2_accu);
    accumulate( err_accus, mg, ifaceidx.TriangLevel(), ifaceidx.GetMatchingFunction(), ifaceidx.GetBndInfo());

    if (P.get<int>( "SolutionOutput.Freq") > 0) {
        DROPS::WriteFEToFile( x, mg, P.get<std::string>( "SolutionOutput.Path"), P.get<bool>( "SolutionOutput.Binary"));
        DROPS::WriteFEToFile( xp2, mg, P.get<std::string>( "SolutionOutput.Path") + "_p2", P.get<bool>( "SolutionOutput.Binary"));
    }

    DROPS::IdxDescCL ifacefullidx( DROPS::P1_FE);
    ifacefullidx.CreateNumbering( mg.GetLastLevel(), mg);
    DROPS::VecDescCL xext( &ifacefullidx);
    DROPS::Extend( mg, x, xext);
    DROPS::NoBndDataCL<> nobnd;
    DROPS::NoBndDataCL<Point3DCL> nobnd_vec;
    VecDescCL the_sol_vd( &lset.idx);
    LSInit( mg, the_sol_vd, &laplace_beltrami_0_sol, /*t*/ 0.);
    if (vtkwriter.get() != 0) {
        vtkwriter->Register( make_VTKScalar( lset.GetSolution(), "Levelset") );
        vtkwriter->Register( make_VTKIfaceScalar( mg, x, "InterfaceSol"));
        vtkwriter->Register( make_VTKIfaceScalar( mg, xp2, "InterfaceSolP2"));
        vtkwriter->Register( make_VTKScalar(      make_P2Eval( mg, nobnd, the_sol_vd),  "TrueSol"));
        vtkwriter->Register( make_VTKVector( make_P2Eval( mg, nobnd_vec, lsgradrec), "LSGradRec") );
        vtkwriter->Register( make_VTKVector( make_P2Eval( mg, nobnd_vec, to_iface), "to_iface") );
        vtkwriter->Write( 0.);
    }

    double L2_err( L2_error( lset.Phi, lset.GetBndData(), make_P1Eval( mg, nobnd, xext), &laplace_beltrami_0_sol));
    std::cout << "L_2-error: " << L2_err << std::endl;
}

int main (int argc, char* argv[])
{
  try {
    ScopeTimerCL timer( "main");

    DROPS::read_parameter_file_from_cmdline( P, argc, argv, "surfactant.json");
    std::cout << P << std::endl;

    DROPS::dynamicLoad(P.get<std::string>("General.DynamicLibsPrefix"), P.get<std::vector<std::string> >("General.DynamicLibs") );

    std::cout << "Setting up interface-PDE.\n";
    WindVelocity= P.get<DROPS::Point3DCL>("Exp.Velocity");
    RadDrop=      P.get<DROPS::Point3DCL>("Exp.RadDrop");
    PosDrop=      P.get<DROPS::Point3DCL>("Exp.PosDrop");
    RadTorus=     P.get<DROPS::Point2DCL>("Exp.RadTorus");
    the_wind_fun= invecmap[P.get<std::string>("Exp.Wind")];
    the_lset_fun= inscamap[P.get<std::string>("Exp.Levelset")];
    the_rhs_fun=  inscamap[P.get<std::string>("Exp.Rhs")];
    the_sol_fun=  inscamap[P.get<std::string>("Exp.Solution")];
    for (Uint i= 0; i < 6; ++i)
        bf_wind[i]= the_wind_fun;

    std::cout << "Setting up domain:\n";
    std::auto_ptr<MGBuilderCL> builder( make_MGBuilder( P.get_child( "Domain")));
    DROPS::MultiGridCL mg( *builder);
    DROPS::AdapTriangCL adap( mg, P.get<double>("AdaptRef.Width"),
                              P.get<int>("AdaptRef.CoarsestLevel"), P.get<int>("AdaptRef.FinestLevel"));

    // DROPS::LevelsetP2CL lset( mg, lsbnd, sf);
    DROPS::LevelsetP2CL& lset( *LevelsetP2CL::Create( mg, lsbnd, sf, P.get_child("Levelset")) );

    if (P.get<int>("VTK.VTKOut",0))
        vtkwriter= std::auto_ptr<VTKOutCL>( new VTKOutCL(
            adap.GetMG(),
            "DROPS data",
            P.get<int>("Time.NumSteps")/P.get<int>("VTK.VTKOut") + 1,
            P.get<std::string>("VTK.VTKDir"),
            P.get<std::string>("VTK.VTKName"),
            P.get<std::string>("VTK.TimeFileName"),
            P.get<int>("VTK.Binary"), 
            P.get<bool>("VTK.UseOnlyP1"),
            false, /* <- P2DG */
            -1,    /* <- level */
            P.get<bool>("VTK.ReUseTimeFile")));
    if (P.get<bool>( "Exp.StationaryPDE"))
        if (P.get<int>( "SurfTransp.FEDegree") == 1)
            StationaryStrategy( mg, adap, lset);
        else
            StationaryStrategyHighOrder( mg, adap, lset);
    else
        Strategy( mg, adap, lset);

    delete &lset;
    rusage usage;
    getrusage( RUSAGE_SELF, &usage);
    std::cout << "ru_maxrss: " << usage.ru_maxrss << " kB.\n";
    return 0;
  }
  catch (DROPS::DROPSErrCL err) { err.handle(); }
}
