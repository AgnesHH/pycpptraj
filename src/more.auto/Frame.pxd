# distutils: language = c++
from libcpp cimport vector
from Atom cimport *
from AtomMask cimport *
from Box cimport *


cdef extern from "Frame.h": 
    ctypedef vector[float] CRDtype
    ctypedef enum CenterMode "Frame::CenterMode":
        ORIGIN "Frame::ORIGIN"
        BOXCTR "Frame::BOXCTR"
        POINT "Frame::POINT"
    cdef cppclass _Frame "Frame":
        _Frame() 
        #~_Frame() 
        _Frame(int)
        _Frame(const vector[_Atom] &)
        _Frame(const _Frame&, const _AtomMask&)
        _Frame(const _Frame &)
        #_Frame & operator =(_Frame)
        void SetFromCRD(const CRDtype&, int, int, bint)
        void SetFromCRD(const CRDtype&, const _AtomMask&, int, int, bint)
        CRDtype ConvertToCRD(int, bint)const 
        void print_AtomCoord(int)const 
        void Info(const char *)const 
        void Clear_Atoms() 
        void AddXYZ(const double *)
        void Add_Vec3(const _Vec3&)
        void Swap_Atoms(int, int)
        double & operator [ ](int idx)
        const double & operator [ ](int idx)const 
        bint empty() const 
        bint HasVelocity() const 
        int Natom() const 
        int size() const 
        int NrepDims() const 
        double Temperature() const 
        const double * XYZ(int atnum)const 
        const double * CRD(int idx)const 
        const double * VXYZ(int atnum)const 
        double Mass(int atnum)const 
        const _Box & _BoxCrd() const 
        inline double * xAddress() 
        inline double * vAddress() 
        inline double * bAddress() 
        inline double * tAddress() 
        inline int * iAddress() 
        inline const double * xAddress() const 
        inline const double * vAddress() const 
        inline const double * bAddress() const 
        inline const double * tAddress() const 
        inline const int * iAddress() const 
        inline void Set_BoxAngles(const double *)
        int Setup_Frame(int)
        int Setup_FrameM(const vector[_Atom]&)
        int Setup_FrameXM(const vector[double]&, const vector[double]&)
        int Setup_FrameV(const vector[_Atom]&, bint, int)
        int Setup_FrameFromMask(const _AtomMask&, const vector[_Atom]&)
        void SetCoordinates(const _Frame&, const _AtomMask&)
        void SetCoordinates(const _Frame&)
        void Set_Frame(const _Frame&, const _AtomMask&)
        void SetCoordinatesByMap(const _Frame&, const vector[int]&)
        void SetReferenceByMap(const _Frame&, const vector[int]&)
        void SetTargetByMap(const _Frame&, const vector[int]&)
        void ZeroCoords() 
        #_Frame & operator + =(const _Frame &)
        #_Frame & operator - =(const _Frame &)
        #_Frame & operator * =(const _Frame &)
        #const _Frame operator *(const _Frame &)const 
        #const _Frame operator -(const _Frame &)const 
        int Divide(const _Frame&, double)
        void Divide(double)
        void AddByMask(const _Frame&, const _AtomMask&)
        inline bint CheckCoordsInvalid() const 
        inline _Vec3 VCenterOfMass(const _AtomMask&)const 
        inline _Vec3 VGeometricCenter(const _AtomMask&)const 
        inline _Vec3 VCenterOfMass(int, int)const 
        inline _Vec3 VGeometricCenter(int, int)const 
        inline void Translate(const _Vec3&, int, int)
        inline void Translate(const _Vec3&, int)
        inline void Translate(const _Vec3 &)
        inline void NegTranslate(const _Vec3 &)
        inline void Rotate(const _Matrix_3x3 &)
        inline void Rotate(const _Matrix_3x3 &, const _AtomMask&)
        inline void Trans_Rot_Trans(const _Vec3 &, const _Matrix_3x3 &, const _Vec3 &)
        void Scale(const _AtomMask&, double, double, double)
        void Center(const _AtomMask&, CenterMode, const _Vec3 &, bint)
        _Vec3 CenterOnOrigin(bint)
        double RMSD(_Frame &, bint)
        double RMSD(_Frame &, _Matrix_3x3 &, _Vec3 &, _Vec3 &, bint)
        double RMSD_CenteredRef(const _Frame&, bint)
        double RMSD_CenteredRef(const _Frame&, _Matrix_3x3 &, _Vec3 &, bint)
        double RMSD_NoFit(const _Frame&, bint)const 
        double DISTRMSD(const _Frame&)const 
        _Vec3 SetAxisOfRotation(int, int)
        _Vec3 CalculateInertia(const _AtomMask&, _Matrix_3x3 &)const 
        double CalcTemperature(const _AtomMask&, int)const 
