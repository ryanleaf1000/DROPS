//**************************************************************************
// File:    fe.h                                                           *
// Content: description of various finite-element functions                *
// Author:  Sven Gross, Joerg Peters, Volker Reichelt, IGPM RWTH Aachen    *
// Version: 0.1                                                            *
// History: begin - May, 2 2001                                            *
//**************************************************************************
// TODO: Faces for P1/2EvalCL!!!

#ifndef DROPS_FE_H
#define DROPS_FE_H


#include "misc/container.h"
#include "geom/topo.h"
#include "geom/multigrid.h"
#include "misc/problem.h"


namespace DROPS
{

//**************************************************************************
// Class:   FE_P1CL                                                        *
// Purpose: Shape functions and their gradients for piecewise linear,      *
//          continuous finite elements on the reference tetrahedron        *
//          The number of the H-functions refers to the number of the      *
//          vertex in the tetrahedron as defined in topo.h, where the      *
//          degree of freedom is located.                                  *
//**************************************************************************
class FE_P1CL
{
private:
    static const double _gradient[4][3];
    
public:
    // default ctor, copy-ctor, assignment-op, dtor

    static const Uint NumDoFC= 4;

    // restriction of the shape functions to reference edge
    static double H0(double v1) { return 1. -v1; }
    static double H1(double v1) { return v1; }

    // restriction of the shape functions to reference face
    static double H0(double v1, double v2) { return 1. -v1 -v2; }
    static double H1(double v1, double)    { return v1; }
    static double H2(double, double v2)    { return v2; }

    // shape functions on the reference tetrahedron
    static double H0(double v1, double v2, double v3) { return 1. -v1 -v2 -v3; }
    static double H1(double v1, double, double)       { return v1; }
    static double H2(double, double v2, double)       { return v2; }
    static double H3(double, double, double v3)       { return v3; }

    static inline double H( Uint dof, double v1, double v2, double v3);

    // gradients of the shape functions on the reference tetrahedron.
    // To obtain the gradient on tetra T: Let f:x->A*x+b be the affine
    // transformation that maps the reference tetrahefron to T.
    // Then DHi(y) == inverse(transpose(A))*DHiRef(x), where y=f(x).
    static SVectorCL<3> DH0Ref() { return _gradient[0]; }
    static SVectorCL<3> DH1Ref() { return _gradient[1]; }
    static SVectorCL<3> DH2Ref() { return _gradient[2]; }
    static SVectorCL<3> DH3Ref() { return _gradient[3]; }

    // DHRef(i, ...) == DHiRef(...)
    static SVectorCL<3> DHRef(Uint i) { return _gradient[i]; }
};


//**************************************************************************
// Class:   FE_P2CL                                                        *
// Purpose: Shape functions and their gradients for piecewise quadratic,   *
//          continuous finite elements on the reference tetrahedron        *
//          The number of the H-functions refers to the number of the      *
//          (mid-) vertex in the tetrahedron as defined in topo.h, where   *
//          the degree of freedom is located.                              *
//**************************************************************************
class FE_P2CL
{
  private:
    static const double _D2H[10][3][3];

  public:
    // default ctor, copy-ctor, assignment-op, dtor

    static const Uint NumDoFC= 10;

    // restriction of the shape functions to reference edge
    static double H0(double v1) { return 1. +v1*(2.*v1 -3.); }
    static double H1(double v1) { return v1*(2.*v1 -1.); }
    static double H2(double v1) { return 4.*v1*(1. -v1); }

    // restriction of the shape functions to reference face
    static double H0(double v1, double v2) { const double sum= v1 + v2; return 1. +sum*(2.*sum -3.); }
    static double H1(double v1, double)    { return v1*(2.*v1 -1.); }
    static double H2(double, double v2)    { return v2*(2.*v2 -1.); }
    static double H3(double v1, double v2) { return 4.*v1*( 1. -(v1 + v2) ); }
    static double H4(double v1, double v2) { return 4.*v2*( 1. -(v1 + v2) ); }
    static double H5(double v1, double v2) { return 4.*v1*v2; }

    // restriction of the shape functions to reference tetrahedron
    static double H0(double v1, double v2, double v3) { const double sum= v1 + v2 + v3; return 1. +sum*(2.*sum -3.); }
    static double H1(double v1, double, double)       { return v1*(2.*v1 -1.); }
    static double H2(double, double v2, double)       { return v2*(2.*v2 -1.); }
    static double H3(double, double, double v3)       { return v3*(2.*v3 -1.); }
    static double H4(double v1, double v2, double v3) { return 4.*v1*( 1. -(v1 + v2 + v3) ); }
    static double H5(double v1, double v2, double v3) { return 4.*v2*( 1. -(v1 + v2 + v3) ); }
    static double H6(double v1, double v2, double)    { return 4.*v1*v2; }
    static double H7(double v1, double v2, double v3) { return 4.*v3*( 1. -(v1 + v2 + v3) ); }
    static double H8(double v1, double, double v3)    { return 4.*v1*v3; }
    static double H9(double, double v2, double v3)    { return 4.*v2*v3; }
    static inline double H (Uint dof, double v1, double v2, double v3);

    // restriction of the shape functions to reference tetrahedron, barucentric coordinates
    static inline double H0(const BaryCoordCL& p) { return p[0]*(2.*p[0] - 1.); }
    static inline double H1(const BaryCoordCL& p) { return p[1]*(2.*p[1] - 1.); }
    static inline double H2(const BaryCoordCL& p) { return p[2]*(2.*p[2] - 1.); }
    static inline double H3(const BaryCoordCL& p) { return p[3]*(2.*p[3] - 1.); }
    static inline double H4(const BaryCoordCL& p) { return 4.*p[0]*p[1]; }
    static inline double H5(const BaryCoordCL& p) { return 4.*p[0]*p[2]; }
    static inline double H6(const BaryCoordCL& p) { return 4.*p[1]*p[2]; }
    static inline double H7(const BaryCoordCL& p) { return 4.*p[0]*p[3]; }
    static inline double H8(const BaryCoordCL& p)    { return 4.*p[1]*p[3]; }
    static inline double H9(const BaryCoordCL& p)    { return 4.*p[2]*p[3]; }
    static inline double H (Uint dof, const BaryCoordCL& p);

  private:
    // Return-type-helper for the evaluation-function val.
    template<class Cont>
      struct ValHelperCL
    {
        typedef typename Cont::value_type value_type;
    };
    template<class T>
      struct ValHelperCL<T*>
    {
        typedef T value_type;
    };
    template<class T, size_t S>
      struct ValHelperCL<T[S]>
    {
        typedef T value_type;
    };

  public:
    template <class Cont>
      static inline typename ValHelperCL<Cont>::value_type
      val(const Cont& c, const BaryCoordCL& p) {
          return c[0] * H0( p) + c[1] * H1( p) + c[2] * H2( p) + c[3] * H3( p)
               + c[4] * H4( p) + c[5] * H5( p) + c[6] * H6( p) + c[7] * H7( p)
               + c[8] * H8( p) + c[9] * H9( p);
      }
    template <class Cont>
      static inline typename ValHelperCL<Cont>::value_type
      val(const Cont& c, double v1, double v2, double v3) {
          return c[0] * H0( v1, v2, v3) + c[1] * H1( v1, v2, v3) + c[2] * H2( v1, v2, v3) + c[3] * H3( v1, v2, v3)
               + c[4] * H4( v1, v2, v3) + c[5] * H5( v1, v2, v3) + c[6] * H6( v1, v2, v3) + c[7] * H7( v1, v2, v3)
               + c[8] * H8( v1, v2, v3) + c[9] * H9( v1, v2, v3);
      }

    // gradients of the shape functions on the reference tetrahedron.
    // To obtain the gradient on tetra T: See comments in FE_P1CL.
    static inline SVectorCL<3> DH0Ref(double, double, double);
    static inline SVectorCL<3> DH1Ref(double, double, double);
    static inline SVectorCL<3> DH2Ref(double, double, double);
    static inline SVectorCL<3> DH3Ref(double, double, double);
    static inline SVectorCL<3> DH4Ref(double, double, double);
    static inline SVectorCL<3> DH5Ref(double, double, double);
    static inline SVectorCL<3> DH6Ref(double, double, double);
    static inline SVectorCL<3> DH7Ref(double, double, double);
    static inline SVectorCL<3> DH8Ref(double, double, double);
    static inline SVectorCL<3> DH9Ref(double, double, double);

    // DHREef(i, ...) == DHiRef(...)
    static inline SVectorCL<3> DHRef(Uint dof, double v1, double v2, double v3);

    // D2HRef(i) == second derivative of H_i; this is constant
    // diff( H_d(x), k,i) = sum( M_ij*M_kl*D2HRef(d, j, l), j,l=0..2)
    static inline double D2HRef(Uint dof, Uint r, Uint s)
        { return _D2H[dof][r][s]; }

    // Laplace(H_d) on a tetrahedron T; M:= transpose(inverse(A)), where A is the matrix
    // of the affine transformation that maps the reference tetrahedron onto T.
    static inline double Laplace(Uint dof, const SMatrixCL<3,3>& M);
};


//**************************************************************************
// Class:   FE_P1BubbleCL                                                  *
// Purpose: Shape functions and their gradients for the mini element.      *
//          The number of the H-functions refers to the number of the      *
//          vertex in the tetrahedron as defined in topo.h, where the      *
//          degree of freedom is located. The last shape function is the   *
//          bubble function on the tetrahedron.                            *
//**************************************************************************
class FE_P1BubbleCL
{
private:
    static const FE_P1CL _LinFun;
    
public:
    // default ctor, copy-ctor, assignment-op, dtor

    static const Uint NumDoFC= 5;

    // restriction of the shape functions to reference edge
    static double H0(double v1) { return 1. -v1; }
    static double H1(double v1) { return v1; }

    // restriction of the shape functions to reference face
    static double H0(double v1, double v2) { return 1. -v1 -v2; }
    static double H1(double v1, double)    { return v1; }
    static double H2(double, double v2)    { return v2; }

    // shape functions on the reference tetrahedron
    static double H0(double v1, double v2, double v3) { return 1. -v1 -v2 -v3; }
    static double H1(double v1, double, double)       { return v1; }
    static double H2(double, double v2, double)       { return v2; }
    static double H3(double, double, double v3)       { return v3; }
    static double H4(double v1, double v2, double v3) { return 256.*v1*v2*v3*(1 -v1 -v2 -v3); }

    // gradients of the shape functions on the reference tetrahedron.
    // To obtain the gradient on tetra T: Let f:x->A*x+b be the affine
    // transformation that maps the reference tetrahefron to T.
    // Then DHi(y) == inverse(transpose(A))*DHiRef(x), where y=f(x).
    static SVectorCL<3> DH0Ref() { return _LinFun.DH0Ref(); }
    static SVectorCL<3> DH1Ref() { return _LinFun.DH1Ref(); }
    static SVectorCL<3> DH2Ref() { return _LinFun.DH2Ref(); }
    static SVectorCL<3> DH3Ref() { return _LinFun.DH3Ref(); }
    static SVectorCL<3> DH4Ref(double v1, double v2, double v3)
        { const double tmp1= 1. -v1 -v2 -v3; SVectorCL<3> ret(-v1*v2*v3);
          ret[0]+= tmp1*v2*v3; ret[1]+= tmp1*v1*v3; ret[2]+= tmp1*v1*v2;
          return 256.*ret; }

    // DHREef(i, ...) == DHiRef(...)
    static SVectorCL<3> DHRef(Uint i) { return _LinFun.DHRef(i); }
    static SVectorCL<3> DHRef(Uint i, double v1, double v2, double v3)
        { return i<4 ? DHRef(i) : DH4Ref(v1, v2, v3); }
};


//**************************************************************************
// Class:   DoFHelperCL                                                    *
// Template Parameter:                                                     *
//          Data - The result-type of the finite-element-function on the   *
//                 multigrid                                               *
//          _Vec - The type of the object, that is used for actually       *
//                 storing numerical data, which is referenced by          *
//                 UnknownIdxCL. It is assumed to provide operator[] to    *
//                 access numerical data.                                  *
// Purpose: This class provides an interface for the PiEvalCL to translate *
//          numerical data in _Vec-objects and Data-objects. It must be    *
//          specialized for each Data - type that is used to represent     *
//          numerical data in PDE-solvers, discretizers, etc., as it       *
//          defines the mapping between the "PDE-data-format" (Data) and   *
//          the format for storing a collection of objects of this type    *
//          (_Vec).                                                        *
//          As there is no default-mapping, the general template will throw*
//          an exception upon usage.                                       *
//**************************************************************************
template<class Data, class _Vec>
struct DoFHelperCL
{
    // read the Data-object referenced by IdxT in _Vec
    static inline Data
    get(const _Vec&, const IdxT)
    { throw DROPSErrCL("DoFHelperCL::get: Unknown data-type"); return Data(); }
    // write the Data-object at position IdxT to the _Vec-object 
    static inline void
    set(_Vec&, const IdxT, const Data&)
    { throw DROPSErrCL("DoFHelperCL::set: Unknown data-type"); }
};

//**************************************************************************
// Class:   DoFHelperCL                                                    *
// Template Parameter:                                                     *
//          Data - double, partial specialization of the general template  *
//          _Vec - The type of the object, that is used for actually       *
//                 storing numerical data, which is referenced by          *
//                 UnknownIdxCL. It is assumed to provide operator[] to    *
//                 access numerical data.                                  *
// Purpose: reads and writes double-objects from / to _Vec objects         *
//          interpreting IdxT as index in _Vec.                            *
//**************************************************************************
template<class _Vec>
struct DoFHelperCL<double, _Vec>
{
    static inline double
    get(const _Vec& sol, IdxT idx)
    { return sol[idx]; }
    static inline void
    set(_Vec& sol, IdxT idx, double val)
    { sol[idx]= val; }
};

//**************************************************************************
// Class:   DoFHelperCL                                                    *
// Template Parameter:                                                     *
//          _Len - Length of SVectorCL used as Data                        *
//          Data - SVector<_Len>, partial specialization of the general    *
//                 template                                                *
//          _Vec - The type of the object, that is used for actually       *
//                 storing numerical data, which is referenced by          *
//                 UnknownIdxCL. It is assumed to provide operator[] to    *
//                 access numerical data.                                  *
// Purpose: reads and writes SVectoCL<_Len>-objects from / to _Vec objects *
//          interpreting idx,idx+1, ..., idx+_Len-1 as the indices of the  *
//          components of SVector<_Len>.                                   *
//**************************************************************************
template<Uint _Len, class _Vec>
struct DoFHelperCL<SVectorCL<_Len>, _Vec>
{
    static inline SVectorCL<_Len>
    get(const _Vec& sol, IdxT idx)
    { SVectorCL<_Len> ret; for (IdxT i=0; i<_Len; ++i) ret[i]= sol[idx++]; return ret;}
    static inline void
    set(_Vec& sol, IdxT idx, const SVectorCL<_Len>& val)
    { for (IdxT i=0; i<_Len; ++i) sol[idx++]= val[i]; }
};


//**************************************************************************
// Class:   P1EvalCL                                                   *
// Template Parameter:                                                     *
//          Data     - The result-type of this finite-element-function on  *
//                     the multigrid                                       *
//          _BndData - Class-type that contains functions that describe,   *
//                     how to handle values in boundary-simplices:         *
//                     bool IsOnDirBnd(VertexCL) - iff true, we use        *
//                     Data GetDirBndValue(T) to obtain the function value *
//          _VD      - (const-) VecDescBaseCL<> like type - type of the    *
//                     container that stores numerical data of this finite-*
//                     element function. The class must contain the typedef*
//                     DataType representing the type used for storing     *
//                     numerical data.                                     *
// Purpose: Abstraction that represents boundary-data and VecDescCL-objects*
//          as a function on the multigrid, that can be evaluated on       *
//          vertices, edges, faces and tetrahedrons via val()-functions and*
//          coordinates in the reference tetrahedron.                      *
//          Degrees of freedom can be set, via SetDoF.                     *
//          We provide GetDoF(S) for simplices S to store all relevant     *
//          numerical data via push_back() in a container. This container  *
//          can be passed to a special val() function and allows for faster*
//          evaluation of the FE-function, if several evaluations on the   *
//          same simplex are necessary.                                    *
//          Generally, evaluations on lower-dimensional simplices are      *
//          faster as only a smaller amount of shape-functions has to be   *
//          evaluated.                                                     *
//**************************************************************************
template<class Data, class _BndData, class _VD>
class P1EvalCL
{
public:
    typedef Data     DataT;
    typedef _BndData BndDataCL;
    typedef _VD      VecDescT;
    typedef P1EvalCL<Data, _BndData, _VD> _self;
    
protected:
    // numerical data
    VecDescT*          _sol;
    // boundary-data
    BndDataCL*         _bnd;
    // the multigrid
    const MultiGridCL* _MG;
    double t_;

    inline DataT // helper-function to evaluate on a vertex; use val() instead
    GetDoF(const VertexCL& s) const {
        return _bnd->IsOnDirBnd( s) ? _bnd->GetDirBndValue( s, t_)
            : DoFHelperCL<DataT, typename VecDescT::DataType>::get( _sol->Data, s.Unknowns(_sol->RowIdx->GetIdx()));
    }

public:
    P1EvalCL() :_sol( 0), _bnd( 0), _MG( 0), t_( 0) {}
    P1EvalCL(_VD* sol, _BndData* bnd, const MultiGridCL* MG, double t= 0.0)
        :_sol( sol), _bnd( bnd), _MG( MG), t_( t) {}
    // default copy-ctor, dtor, assignment-op
    // copying P1EvalCL-objects is safe - it is a flat copy, which is fine,
    // as P1EvalCL does not take possession of the pointed to _sol, _bnd and _MG.

    void // set / get the container of numerical data
    SetSolution(VecDescT* sol)
        { _sol= sol; }
    VecDescT*
    GetSolution() const
        { return _sol; }
    void // set / get the container of boundary-data
    SetBndData(BndDataCL* bnd)
        { _bnd= bnd; }
    BndDataCL*
    GetBndData() const
        { return _bnd; }
    const MultiGridCL&
    GetMG() const // the multigrid we refer to
        { return *_MG; }
    Uint
    GetLevel() const // Triangulation level of this function
        { return _sol->GetLevel(); }
    void // set / get the time
    SetTime(double t)
        { t_= t; }
    double
    GetTime() const
        { return t_; }

    // evaluation on vertices    
    template<class _Cont>
      inline void
      GetDoF(const VertexCL&, _Cont&) const;
    inline DataT
    val(const VertexCL&) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&) const;
    
    // evaluation on edges
    template<class _Cont>
      inline void
      GetDoF(const EdgeCL&, _Cont&) const;
    inline DataT
    val(const EdgeCL&, double) const;
    template<class _Cont>
      inline Data
      val(const _Cont&, double) const;

    // evaluation on the tetrahedron
    template<class _Cont>
      inline void
      GetDoF(const TetraCL&, _Cont&) const;
    inline DataT
    val(const TetraCL&, double, double, double) const;
    template<class _Cont>
      inline Data
      val(const _Cont&, double, double, double) const;

    inline void // set the degree of freedom in this vertex; fails for Dirichlet-vertices
    SetDoF(const VertexCL&, const DataT&);
};


//**************************************************************************
// Class:   P2EvalCL                                                       *
// Template Parameter:                                                     *
//          Data     - The result-type of this finite-element-function on  *
//                     the multigrid                                       *
//          _BndData - Class-type that contains functions that describe,   *
//                     how to handle values in boundary-simplices:         *
//                     bool IsOnDirBnd(VertexCL) - iff true, we use        *
//                     Data GetDirBndValue(T) to obtain the function value *
//          _VD      - (const-) VecDescBaseCL<> like type - type of the    *
//                     container that stores numerical data of this finite-*
//                     element function. The class must contain the typedef*
//                     DataType representing the type used for storing     *
//                     numerical data.                                     *
// Purpose: Abstraction that represents boundary-data and VecDescCL-objects*
//          as a function on the multigrid, that can be evaluated on       *
//          vertices, edges, faces and tetrahedrons via val()-functions and*
//          coordinates in the reference tetrahedron.                      *
//          Degrees of freedom can be set, via SetDoF.                     *
//          We provide GetDoF(S) for simplices S to store all relevant     *
//          numerical data via push_back() in a container. This container  *
//          can be passed to a special val() function and allows for faster*
//          evaluation of the FE-function, if several evaluations on the   *
//          same simplex are necessary.                                    *
//          Generally, evaluations on lower-dimensional simplices are      *
//          faster as only a smaller amount of shape-functions has to be   *
//          evaluated.                                                     *
//**************************************************************************
template<class Data, class _BndData, class _VD>
class P2EvalCL
{
public:
    typedef Data     DataT;
    typedef _BndData BndDataCL;
    typedef _VD      VecDescT;
    typedef P2EvalCL<Data, _BndData, _VD> _self;

protected:
    // numerical data
    VecDescT*          _sol;
    // boundary-data
    BndDataCL*         _bnd;
    // the multigrid
    const MultiGridCL* _MG;
    double t_;

    inline DataT // helper-function to evaluate on a vertex; use val() instead
    GetDoF(const VertexCL& s) const
    {
        return _bnd->IsOnDirBnd(s) ? _bnd->GetDirBndValue(s, t_)
            : DoFHelperCL<DataT,typename VecDescT::DataType>::get(
            _sol->Data, s.Unknowns(_sol->RowIdx->GetIdx()));
    }
    inline DataT // helper-function to evaluate on an edge; use val() instead
    GetDoF(const EdgeCL& s) const
    {
        return _bnd->IsOnDirBnd(s) ? _bnd->GetDirBndValue(s, t_)
            : DoFHelperCL<DataT,typename VecDescT::DataType>::get(
            _sol->Data, s.Unknowns(_sol->RowIdx->GetIdx()));
    }

public:
    P2EvalCL() :_sol( 0), _bnd( 0), _MG( 0), t_( 0) {}
    P2EvalCL(VecDescT* sol, BndDataCL* bnd, const MultiGridCL* MG, double t= 0.0)
        :_sol( sol), _bnd( bnd), _MG( MG), t_( t) {}
    //default copy-ctor, dtor, assignment-op
    // copying P2EvalCL-objects is safe - it is a flat copy, which is fine,
    // as P2EvalCL does not take possession of the pointed to _sol, _bnd and _MG.

    void // set / get the container of numerical data
    SetSolution(VecDescT* sol) { _sol= sol; }
    VecDescT*
    GetSolution() const { return _sol; }
    void // set / get the container of boundary-data
    SetBndData(BndDataCL* bnd) { _bnd= bnd; }
    BndDataCL*
    GetBndData() const { return _bnd; }
    const MultiGridCL& // the multigrid we refer to
    GetMG() const { return *_MG; }
    Uint // Triangulation level of this function
    GetLevel() const { return _sol->GetLevel(); }
    // The time at which boundary data is evaluated.
    double GetTime() const { return t_; }
    void SetTime(double t) { t_= t; }

    inline bool UnknownsMissing(const TetraCL& t) const;
    // True, iff the function can be evaluated on the given simplex.
    inline bool IsDefinedOn(const VertexCL&) const;
    inline bool IsDefinedOn(const EdgeCL&) const;
    inline bool IsDefinedOn(const TetraCL&, Uint) const;
    inline bool IsDefinedOn(const TetraCL&) const;

    // evaluation on vertices    
    inline void // set the degree of freedom in the vertex; fails if, we are on a Dirichlet-boundary
    SetDoF(const VertexCL&, const DataT&);
    template<class _Cont>
      inline void
      GetDoF(const VertexCL& s, _Cont& c) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&) const;
    inline DataT
    val(const VertexCL& s) const;
    
    // evaluation on edges
    inline void // set the degree of freedom on the edge; fails if, we are on a Dirichlet-boundary
    SetDoF(const EdgeCL&, const DataT&);
    template<class _Cont>
      inline void
      GetDoF(const EdgeCL& s, _Cont& c) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&, double) const;
    inline DataT
    val(const EdgeCL& s, double v1) const;
    inline DataT // for your convenience: val(edge) == val(edge, 0.5)
    val(const EdgeCL& s) const;

    // evaluation on faces
    template<class _Cont>
      inline void
      GetDoF(const TetraCL& s, Uint i, _Cont& c) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&, double, double) const;
    inline DataT
    val(const TetraCL& s, Uint i, double v1, double v2) const;

    // evaluation on a tetrahedron
    template<class _Cont>
      inline void
      GetDoF(const TetraCL& s, _Cont& c) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&, double, double, double) const;
    inline DataT
    val(const TetraCL& s, double v1, double v2, double v3) const;
};


//**************************************************************************
// Class:   P1BubbleEvalCL                                                 *
// Template Parameter:                                                     *
//          Data     - The result-type of this finite-element-function on  *
//                     the multigrid                                       *
//          _BndData - Class-type that contains functions that describe,   *
//                     how to handle values in boundary-simplices:         *
//                     bool IsOnDirBnd(VertexCL) - iff true, we use        *
//                     Data GetDirBndValue(T) to obtain the function value *
//          _VD      - (const-) VecDescBaseCL<> like type - type of the    *
//                     container that stores numerical data of this finite-*
//                     element function. The class must contain the typedef*
//                     DataType representing the type used for storing     *
//                     numerical data.                                     *
// Purpose: Abstraction that represents boundary-data and VecDescCL-objects*
//          as a function on the multigrid, that can be evaluated on       *
//          vertices, edges, faces and tetrahedrons via val()-functions and*
//          coordinates in the reference tetrahedron.                      *
//          Degrees of freedom can be set, via SetDoF.                     *
//          We provide GetDoF(S) for simplices S to store all relevant     *
//          numerical data via push_back() in a container. This container  *
//          can be passed to a special val() function and allows for faster*
//          evaluation of the FE-function, if several evaluations on the   *
//          same simplex are necessary.                                    *
//          Generally, evaluations on lower-dimensional simplices are      *
//          faster as only a smaller amount of shape-functions has to be   *
//          evaluated.                                                     *
//**************************************************************************
template<class Data, class _BndData, class _VD>
class P1BubbleEvalCL
{
public:
    typedef Data     DataT;
    typedef _BndData BndDataCL;
    typedef _VD      VecDescT;
    
private:
    // numerical data
    VecDescT*          _sol;
    // boundary-data
    BndDataCL*         _bnd;
    // the multigrid
    const MultiGridCL* _MG;

    inline DataT // helper-function to evaluate the degree of freedom in a vertex,
    GetDoF(const VertexCL&) const;// use val() instead
    inline DataT // helper-function to evaluate the degree of freedom in a tetra
    GetDoF(const TetraCL&) const;
       
public:
    P1BubbleEvalCL() :_sol(0), _MG(0) {}
    P1BubbleEvalCL(_VD* sol, _BndData* bnd, const MultiGridCL* MG)
        :_sol(sol), _bnd(bnd), _MG(MG) {}
    // default copy-ctor, dtor, assignment-op
    // copying P1BubbleEvalCL-objects is safe - it is a flat copy, which is fine,
    // as P1BubbleEvalCL does not take possession of the pointed to _sol, _bnd and _MG.

    void // set / get the container of numerical data
    SetSolution(VecDescT* sol)
        { _sol= sol; }
    VecDescT*
    GetSolution() const
        { return _sol; }
    void // set / get the container of boundary-data
    SetBndData(BndDataCL* bnd)
        { _bnd= bnd; }
    BndDataCL*
    GetBndData() const
        { return _bnd; }
    const MultiGridCL&
    GetMG() const // the multigrid we refer to
        { return *_MG; }
    Uint
    GetLevel() const // Triangulation level of this function
        { return _sol->GetLevel(); }

    // evaluation on vertices    
    template<class _Cont>
      inline void
      GetDoF(const VertexCL&, _Cont&) const;
    inline void // set the degree of freedom in this vertex; fails for Dirichlet-vertices
    SetDoF(const VertexCL&, const DataT&);
    template<class _Cont>
      inline DataT
      val(const _Cont&) const;
    inline DataT
    val(const VertexCL&) const;
    
    // evaluation on edges
    template<class _Cont>
      inline void
      GetDoF(const EdgeCL&, _Cont&) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&, double) const;
    inline DataT
    val(const EdgeCL&, double) const;

    // evaluation on the tetrahedron
    template<class _Cont>
      inline void
      GetDoF(const TetraCL&, _Cont&) const;
    template<class _Cont>
      inline DataT
      val(const _Cont&, double, double, double) const;
    inline DataT
    val(const TetraCL&, double, double, double) const;
    inline DataT
    lin_val(const TetraCL&, double, double, double) const;
    inline DataT
    bubble_val(const TetraCL&, double, double, double) const;
};


// This only works, if Interpolate is called after every refinement of the multigrid.
// Take care, that x and old_x are on successive triangulations.
template<class Data, class _BndData, class _VD>
void
Interpolate(P1EvalCL<Data, _BndData, _VD>& sol, const P1EvalCL<Data, _BndData, const _VD>& old_sol);


//**************************************************************************
// RepairAfterRefine: Repairs the P1-function old_f, which is possibly     *
//     damaged by a grid-refinement. This is done by copying to the new    *
//     VecDescBaseCL object vecdesc and interpolation of old values.       *
// Precondition: old_f is a damaged P1-function (through at most one       *
//     refinement step), vecdesc contains a valid IdxDescCL* to an index on*
//     the same level as old_f (If this level was deleted, vecdesc shall be*
//     defined on the next coarser level.); vecdesc.Data has the correct   *
//     size.                                                               *
// Postcondition: vecdesc, together with the boundary-data of old_f,       *
//     represents a P1-function on the triangulation tl. If old_f was      *
//     defined on the last level before refinement, which is then deleted, *
//     tl ==  old_f.GetLevel() -1; else tl is the level of old_f.          *
//**************************************************************************    
template< class Data, class _BndData, class _VD,
          template<class, class, class> class P1T,
          class _VecDesc>
Uint
RepairAfterRefineP1( P1T<Data, _BndData, _VD>& old_f, _VecDesc& vecdesc);


// Adapt a solution on a triangulation of a certain level, that has changed during the refinement.
// Notation: T = old triang, T' = new triang. Both T and T' are of the same level.
// This change can be classified in several cases (not complete...): Fot tetra t in T:
//    a) t is missing not only in T' but in all new triang levels  
//       -> information is lost
//    b) t is missing in T', but is member of the new MultiGrid
//       -> t was refined, children of t are members of T', for these information is interpolated from t!
//    c) t and its brotherhood were replaced by other children
//       -> change of the parents' refinement rule, restore information in parent and interpolate!
// TODO: missing: handling of unrefined Tetras
// Adapt should be very robust in all occuring situations!!!
template<class Data, class _BndData, class _VD>
void Adapt( P2EvalCL<Data, _BndData, _VD>& sol, const P2EvalCL<Data, _BndData, const _VD>& old_sol);


// This only works, if Interpolate is called after every refinement of the multigrid.
// Take care, that x and old_x are on successive triangulations.
template<class Data, class _BndData, class _VD>
void Interpolate(P2EvalCL<Data, _BndData, _VD>& sol, const P2EvalCL<Data, _BndData, const _VD>& old_sol);


//**************************************************************************
// RepairAfterRefine: Repairs the P2-function old_f, which is possibly     *
//     damaged by a grid-refinement. This is done by copying to the new    *
//     VecDescBaseCL object vecdesc and interpolation of old values.       *
// Precondition: old_f is a damaged P2-function (through at most one       *
//     refinement step), vecdesc contains a valid IdxDescCL* to an index on*
//     the same level as old_f (If this level was deleted, vecdesc shall be*
//     defined on the next coarser level.); vecdesc.Data has the correct   *
//     size.                                                               *
// Postcondition: vecdesc, together with the boundary-data of old_f,       *
//     represents a P2-function on the triangulation tl. If old_f was      *
//     defined on the last level before refinement, which is then deleted, *
//     tl ==  old_f.GetLevel() -1; else tl is the level of old_f.          *
//**************************************************************************    
template< class Data, class _BndData, class _VD,
          template<class, class, class> class P2T,
          class _VecDesc>
Uint
RepairAfterRefineP2( P2T<Data, _BndData, _VD>& old_f, _VecDesc& vecdesc);


//**************************************************************************
// SetupP1ProlongationMatrix: Standard prolongation for P1-elements.       *
// Precondition: mg is a multigrid, that has the level given in fIdx.      *
//     cIdx, fIdx are indices on mg, that are defined on consecutive levels*
//     (or the same level). DoF on the boundary are assumed to contain     *
//     function-values (opposed to fancier things like normal-derivatives  *
//     and such). The prolongation is only correct for homogeneous         *
//     Dirichlet boundary values. (Otherwise, one needs a full affine      *
//     trafo.)                                                             *
//     P is an uninitialized MatDescCL-object.                             *
// Postcondition: P contains the row-index fIdx, the column-index cIdx and *
//     the corresponding standard prolongation matrix for P2-elements.     *
//**************************************************************************    
void SetupP1ProlongationMatrix(const MultiGridCL& mg, MatDescCL& P,
                               IdxDescCL* cIdx, IdxDescCL* fIdx);

//**************************************************************************
// SetupP2ProlongationMatrix: Standard prolongation for P2-elements.       *
// Precondition: mg is a multigrid, that has the level given in fIdx.      *
//     cIdx, fIdx are indices on mg, that are defined on consecutive levels*
//     (or the same level). DoF on the boundary are assumed to contain     *
//     function-values (opposed to fancier things like normal-derivatives  *
//     and such). The prolongation is only correct for homogeneous         *
//     Dirichlet boundary values. (Otherwise, one needs a full affine      *
//     trafo.)                                                             *
//     P is an uninitialized MatDescCL-object.                             *
// Postcondition: P contains the row-index fIdx, the column-index cIdx and *
//     the corresponding standard prolongation matrix for P2-elements.     *
//**************************************************************************    
void SetupP2ProlongationMatrix(const MultiGridCL& mg, MatDescCL& P,
                               IdxDescCL* cIdx, IdxDescCL* fIdx);

//**************************************************************************
// RestrictP2: Stores the DoF-values of a P2-function corresponding to vd  *
//     and bnd for tetrahedron s in the container c.                       *
// Precondition: vd is a VecDescCL for a P2-function on level l, bnd is a  *
//     BndDataCL and s a tetrahedron on a level <= l. c is a container     *
//     (component access with []) that can hold at least 10 values of f's  *
//     return type.                                                        *
// Postcondition: c contains the value of f in the 10 DoF in the order used*
//     by FE_P2CL.                                                         *
//**************************************************************************    
template <class VecDescT, class BndDataT, class Cont>
void RestrictP2(const TetraCL& s, const VecDescT& vd, const BndDataT& bnd, Cont& c, double t= 0.0);


template <class P2FuncT, class Cont>
void RestrictP2(const TetraCL& s, const P2FuncT& f, Cont& c, double t= 0.0)
{
    RestrictP2( s, *f.GetSolution(), *f.GetBndData(), c, t);
}



} // end of namespace DROPS

#include "num/fe.tpp"

#endif
