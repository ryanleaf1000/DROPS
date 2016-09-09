/// \file twophaseCoeff.cpp
/// \brief boundary and source functions for the twophasedrops-type problems
/// \author LNM RWTH Aachen: Christoph Lehrenfeld, Yuanjun Zhang

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

#include "misc/funcmap.h"
#include "misc/params.h"

extern DROPS::ParamCL P;

//========================================================================
//          Functions for twophasedrops-executable (inflow)
//========================================================================
namespace tpd_inflow{
    /// \name inflow condition
    DROPS::SVectorCL<3> InflowBrick( const DROPS::Point3DCL& p, double t)
    {
        static double RadInlet=   P.get<double>("Exp.RadInlet");
        static double InflowVel=  P.get<double>("Exp.InflowVel");
        static double InflowAmpl= P.get<double>("Exp.InflowAmpl");
        static double InflowFreq= P.get<double>("Exp.InflowFreq");
        DROPS::SVectorCL<3> ret(0.);
        const double x = p[0]*(2* RadInlet -p[0]) / (RadInlet*RadInlet),
                     z = p[2]*(2*RadInlet-p[2]) / (RadInlet*RadInlet);

        ret[1]= x * z * InflowVel * (1-InflowAmpl*std::cos(2*M_PI*InflowFreq*t));

        return ret;
    }


    ///microchannel (eindhoven)
    DROPS::SVectorCL<3> InflowChannel( const DROPS::Point3DCL& p, double t)
    {
        static double InflowVel=  P.get<double>("Exp.InflowVel");
        static double InflowAmpl= P.get<double>("Exp.InflowAmpl");
        static double InflowFreq= P.get<double>("Exp.InflowFreq");
        DROPS::SVectorCL<3> ret(0.);
        const double y = p[1]*(2*25e-6-p[1]) / (25e-6*25e-6),
                     z = p[2]*(2*50e-6-p[2]) / (50e-6*50e-6);

        ret[0]= y * z * InflowVel * (1-InflowAmpl*std::cos(2*M_PI*InflowFreq*t));

        return ret;
    }

    ///mzelle_ns_adap.cpp + mzelle_instat.cpp
    DROPS::SVectorCL<3> InflowCell( const DROPS::Point3DCL& p, double)
    {
        static double RadInlet=   P.get<double>("Exp.RadInlet");
        static double InflowVel=  P.get<double>("Exp.InflowVel");
        DROPS::SVectorCL<3> ret(0.);
        const double s2= RadInlet*RadInlet,
                     r2= p.norm_sq() - p[P.get<int>("Exp.FlowDir")]*p[P.get<int>("Exp.FlowDir")];
        ret[P.get<int>("Exp.FlowDir")]= -(r2-s2)/s2*InflowVel;

        return ret;
    }

    /// Examplary inflow condition for a shift frame
    DROPS::SVectorCL<3> InflowShiftFrame( const DROPS::Point3DCL&, double)
    {
        static DROPS::SVectorCL<3> FrameVel= P.get<DROPS::Point3DCL>("NavStokes.FrameVel", DROPS::Point3DCL(0.));
        DROPS::SVectorCL<3> ret(0.);
        ret = -FrameVel;
        return ret;
    }

    /// Axial symmetric extensional flow
    DROPS::SVectorCL<3> InflowAxialExtensionalFlow( const DROPS::Point3DCL& p, double)
    {
        DROPS::SVectorCL<3> ret(0.);
        DROPS::SVectorCL<3> PosDrop(0.);
        PosDrop = P.get<DROPS::Point3DCL>("Levelset.PosDrop");
        ret[0]=-0.5*(p[0]-PosDrop[0]);
        ret[1]=-0.5*(p[1]-PosDrop[1]);
        ret[2]= p[2]-PosDrop[2];
        return P.get<double>("Exp.ExtensionalFlowFactor",1.0)*ret;
    }

    /// Plane shear flow (z-direction)
    DROPS::SVectorCL<3> InflowShearFlowZ( const DROPS::Point3DCL& p, double)
    {
        DROPS::SVectorCL<3> ret(0.);
        DROPS::SVectorCL<3> E3(0.);
        E3 = P.get<DROPS::Point3DCL>("Mesh.E3");
        ret[0]=p[2]-0.5*E3[2];
        return P.get<double>("Exp.ShearFlowFactor",1.0)*ret;
    }

    //========================================================================
    //                       Functions for brick_transp.cpp
    //========================================================================

    DROPS::SVectorCL<3> InflowBrickTransp (const DROPS::Point3DCL& p, double)
    {
        static double RadInlet=   P.get<double>("Exp.RadInlet");
        static double InflowVel=  P.get<double>("Exp.InflowVel");
        DROPS::SVectorCL<3> ret(0.);
        const double x = p[0]*(2*RadInlet-p[0]) / (RadInlet*RadInlet),
                     z = p[2]*(2*RadInlet-p[2]) / (RadInlet*RadInlet);
        ret[1]= x * z * InflowVel;
        return ret;
    }

    //========================================================================
    //            Registration of functions in the func-container
    //========================================================================
    static DROPS::RegisterVectorFunction regvelbrick("InflowBrick", InflowBrick);
    static DROPS::RegisterVectorFunction regvelcell("InflowCell", InflowCell);
    static DROPS::RegisterVectorFunction regvelchannel("InflowChannel", InflowChannel);
    static DROPS::RegisterVectorFunction regvelbricktransp("InflowBrickTransp", InflowBrickTransp);
    static DROPS::RegisterVectorFunction regvelshiftframe("InflowShiftFrame", InflowShiftFrame);
    static DROPS::RegisterVectorFunction regvelextensional("InflowAxialExtensionalFlow", InflowAxialExtensionalFlow);
    static DROPS::RegisterVectorFunction regvelshearz("InflowShearFlowZ", InflowShearFlowZ);
}


//========================================================================
//          Functions for twophasedrops-executable (Volume Force)
//========================================================================
namespace tpd_volforce{
    /// \name inflow condition
    template<int D>
    DROPS::SVectorCL<3> PeriodicDropletPressure( const DROPS::Point3DCL& , double )
    {
        DROPS::SVectorCL<3> ret(0.);
        ret[D] = -P.get<DROPS::Point3DCL>("NavStokes.Coeff.Gravity")[D];

        static bool first = true;
        static DROPS::Point3DCL dx;
        //"hack": assume cartesian domain with e1=[a,0,0], e2=[0,b,0], ..
        if (first){
            first = false;
            dx[0] = P.get<DROPS::Point3DCL>("Mesh.E1")[0];
            dx[1] = P.get<DROPS::Point3DCL>("Mesh.E2")[1];
            dx[2] = P.get<DROPS::Point3DCL>("Mesh.E3")[2];
        }

        static double voldrop = 4./3.*M_PI* P.get<DROPS::Point3DCL>("Levelset.RadDrop")[0]*P.get<DROPS::Point3DCL>("Levelset.RadDrop")[1]*P.get<DROPS::Point3DCL>("Levelset.RadDrop")[2] ;
        static double brickvol = dx[0]* dx[1]* dx[2];
        static double volforce = P.get<double>("NavStokes.Coeff.DensPos") * brickvol
                               - ( P.get<double>("NavStokes.Coeff.DensPos")
                                 - P.get<double>("NavStokes.Coeff.DensNeg") ) * voldrop;
        ret[D] *= volforce/brickvol;
        return ret;
    }

    //========================================================================
    //            Registration of functions in the func-container
    //========================================================================
    static DROPS::RegisterVectorFunction regvelppx("PeriodicDropletPressurex", PeriodicDropletPressure<0>);
    static DROPS::RegisterVectorFunction regvelppy("PeriodicDropletPressurey", PeriodicDropletPressure<1>);
    static DROPS::RegisterVectorFunction regvelppz("PeriodicDropletPressurez", PeriodicDropletPressure<2>);
}


//========================================================================
//                       Functions for LevelSet Distance
//========================================================================
namespace levelsetdistance{

    ///mzelle_ns_adap.cpp + mzelle_instat.cpp
    double CubeDistance( const DROPS::Point3DCL& p, double)
    {
        double maxd = - P.get<DROPS::Point3DCL>("Levelset.RadDrop")[0] - P.get<DROPS::Point3DCL>("Levelset.RadDrop")[1]- P.get<DROPS::Point3DCL>("Levelset.RadDrop")[2];
        for (int i=0;i<3;i++){
          double x = std::abs(p[i] - P.get<DROPS::Point3DCL>("Levelset.PosDrop")[i]) - P.get<DROPS::Point3DCL>("Levelset.RadDrop")[i];
          if (x>maxd) maxd=x;
        }
        return maxd;
    }


    ///mzelle_ns_adap.cpp + mzelle_instat.cpp
    template<int i>
    double PeriodicEllipsoidDistance( const DROPS::Point3DCL& p, double)
    {

        static bool first = true;
        static DROPS::Point3DCL dx;

        //hack
        if (first){
            first = false;
            if (i==0)
                dx = P.get<DROPS::Point3DCL>("Mesh.E1");
            else if (i==1)
                dx = P.get<DROPS::Point3DCL>("Mesh.E2");
            else
                dx = P.get<DROPS::Point3DCL>("Mesh.E3");
        }

        DROPS::Point3DCL dp;
        dp[i] = dx[i];
        DROPS::Point3DCL ExpRadDrop = P.get<DROPS::Point3DCL>("Levelset.RadDrop");
        DROPS::Point3DCL ExpPosDrop = P.get<DROPS::Point3DCL>("Levelset.PosDrop");
        DROPS::Point3DCL d= p - ExpPosDrop;
        DROPS::Point3DCL d1= p + dp - ExpPosDrop;
        DROPS::Point3DCL d2= p - dp - ExpPosDrop;
        const double avgRad= cbrt(ExpRadDrop[0]*ExpRadDrop[1]*ExpRadDrop[2]);
        d/= ExpRadDrop;
        d1/= ExpRadDrop;
        d2/= ExpRadDrop;
        double dd = std::min(std::min(d.norm(),d1.norm()),d2.norm());
        return std::abs( avgRad)*dd - avgRad;
    }

    template<int i>
    double planedistance( const DROPS::Point3DCL& p, double)
    {
        double x=p[i]-P.get<DROPS::Point3DCL>("Levelset.PosDrop")[i];
        return x;
    }

    static DROPS::RegisterScalarFunction regsca_pdistx("planedistancex", planedistance<0>);
    static DROPS::RegisterScalarFunction regsca_pdisty("planedistancey", planedistance<1>);
    static DROPS::RegisterScalarFunction regsca_pdistz("planedistancez", planedistance<2>);
    static DROPS::RegisterScalarFunction regscacube("CubeDistance", CubeDistance);
    static DROPS::RegisterScalarFunction regscaperellx("perEllipsoidx", PeriodicEllipsoidDistance<0>);
    static DROPS::RegisterScalarFunction regscaperelly("perEllipsoidy", PeriodicEllipsoidDistance<1>);
    static DROPS::RegisterScalarFunction regscaperellz("perEllipsoidz", PeriodicEllipsoidDistance<2>);
}

//========================================================================
//                       Functions for transport
//========================================================================
namespace transpfunctions{
    double tInitialcneg (const DROPS::Point3DCL& , double)
    {
        return P.get<double>("Transp.IniCNeg");
    }

    double tInitialcpos (const DROPS::Point3DCL& , double)
    {
        return P.get<double>("Transp.IniCPos");
    }
    static DROPS::RegisterScalarFunction regscainineg("Initialcneg", tInitialcneg);
    static DROPS::RegisterScalarFunction regscainipos("Initialcpos", tInitialcpos);
}

//========================================================================
//                       Functions for surfactants
//========================================================================
namespace surffunctions{
    /// \name Initial data and rhs for surfactant transport
    //@{
    const double a( -13./8.*std::sqrt( 35./M_PI));
    double surf_rhs (const DROPS::Point3DCL& p, double)
    {
        return a*(3.*p[0]*p[0]*p[1] - p[1]*p[1]*p[1]);
    }
    double surf_sol (const DROPS::Point3DCL& p, double)
    {
        return 1. + std::sin( atan2( p[0] - P.get<DROPS::Point3DCL>("Levelset.PosDrop")[0], p[2] - P.get<DROPS::Point3DCL>("Levelset.PosDrop")[2]));
    }
    double surf_uniform (const DROPS::Point3DCL&, double)
    {
        return P.get<double>("SurfTransp.InitialConcentration");
    }
    //@}
    static DROPS::RegisterScalarFunction regscasurfrhs("surf_rhs", surf_rhs);
    static DROPS::RegisterScalarFunction regscasurfsol("surf_sol", surf_sol);
    static DROPS::RegisterScalarFunction regscasurfuniform("surf_uniform", surf_uniform);
}

//TODO: unification with filmCoeff stoff
//========================================================================
//                        Functions for matching function
//========================================================================
namespace filmperiodic{
    template<int A, int B>
    bool periodic_2sides( const DROPS::Point3DCL& p, const DROPS::Point3DCL& q)
    {

        static bool first = true;
        static DROPS::Point3DCL dx;

        //"hack": assume cartesian domain with e1=[a,0,0], e2=[0,b,0], ..
        if (first){
            first = false;
            dx[0] = P.get<DROPS::Point3DCL>("Mesh.E1")[0];
            dx[1] = P.get<DROPS::Point3DCL>("Mesh.E2")[1];
            dx[2] = P.get<DROPS::Point3DCL>("Mesh.E3")[2];
        }

        const DROPS::Point3DCL d= fabs(p-q),
                               L= fabs(dx);

        const int D = 3 - A - B;
        return (d[B] + d[D] < 1e-12 && std::abs( d[A] - L[A]) < 1e-12)  // dB=dD=0 and dA=LA
          ||   (d[A] + d[D] < 1e-12 && std::abs( d[B] - L[B]) < 1e-12)  // dA=dD=0 and dB=LB
          ||   (d[D] < 1e-12 && std::abs( d[A] - L[A]) < 1e-12 && std::abs( d[B] - L[B]) < 1e-12);  // dD=0 and dA=LA and dB=LB
    }

    template<int A>
    bool periodic_1side( const DROPS::Point3DCL& p, const DROPS::Point3DCL& q)
    {

        static bool first = true;
        static DROPS::Point3DCL dx;

        //hack
        if (first){
            first = false;
            if (A==0)
                dx = P.get<DROPS::Point3DCL>("Mesh.E1");
            else if (A==1)
                dx = P.get<DROPS::Point3DCL>("Mesh.E2");
            else
                dx = P.get<DROPS::Point3DCL>("Mesh.E3");
        }

        const int B = (A+1)%3;
        const int D = (B+1)%3;
        const DROPS::Point3DCL d= fabs(p-q), L= fabs(dx);

        return (d[B] + d[D] < 1e-12 && std::abs( d[A] - L[A]) < 1e-12);
    }

    //========================================================================
    //        Registration of the function(s) in the func-container
    //========================================================================
    static DROPS::RegisterMatchingFunction regmatch2_xy("periodicxy", periodic_2sides<0,1>);
    static DROPS::RegisterMatchingFunction regmatch2_xz("periodicxz", periodic_2sides<0,2>);
    static DROPS::RegisterMatchingFunction regmatch2_yz("periodicyz", periodic_2sides<1,2>);
    static DROPS::RegisterMatchingFunction regmatch1_x("periodicx", periodic_1side<0>);
    static DROPS::RegisterMatchingFunction regmatch1_y("periodicy", periodic_1side<1>);
    static DROPS::RegisterMatchingFunction regmatch1_z("periodicz", periodic_1side<2>);
}


double TaylorFlowDistance( const DROPS::Point3DCL& p, double)
{
    static const double taylor_len = P.get<double>("Taylor.Length");
    static const double taylor_width = P.get<double>("Taylor.Width");
    static const double rel_filmthickness = P.get<double>("Taylor.RelFilmThickness");
    static const DROPS::Point3DCL taylor_bubble_center = P.get<DROPS::Point3DCL>("Taylor.Center");
    //const double taylor_top_z = taylor_bubble_center[2] + 0.5 * taylor_bubble_len;
    //const double taylor_bottom_z = taylor_bubble_center[2] - 0.5 * taylor_bubble_len;
    const double taylor_radius = (0.5-rel_filmthickness) * taylor_width;
    const double taylor_top_z = taylor_bubble_center[2] + 0.5 * (taylor_len-2*taylor_radius);
    const double taylor_bottom_z = taylor_bubble_center[2] - 0.5 * (taylor_len-2*taylor_radius);
    DROPS::Point3DCL diff = p;
    diff[0] -= taylor_bubble_center[0];
    diff[1] -= taylor_bubble_center[1];
    if (p[2] > taylor_top_z){
        diff[2] -= taylor_top_z;
        return diff.norm() - taylor_radius;
    }
    if (p[2] < taylor_bottom_z){
        diff[2] -= taylor_bottom_z;
        return diff.norm() - taylor_radius;
    }
    diff[2] = 0.0;
    return diff.norm() - taylor_radius;
}

static DROPS::RegisterScalarFunction regscataylor("TaylorFlowDistance", TaylorFlowDistance);


DROPS::SVectorCL<3> TaylorInflow( const DROPS::Point3DCL& p, double)
{
    const double x = p[0] / 6e-3;
    const double y = p[1] / 6e-3;
    const double v = P.get<double>("Taylor.AverageInflowVelocity");
    const double vz = 36*x*(1-x)*y*(1-y)*v;
    return DROPS::MakePoint3D(0,0,-vz);
}

static DROPS::RegisterVectorFunction regvectaylor("TaylorInflow", TaylorInflow);

double SmallDistance( const DROPS::Point3DCL&, double)
{
    return 0.525e-3;
}

static DROPS::RegisterScalarFunction regscasmalldist("SmallDistance", SmallDistance);
