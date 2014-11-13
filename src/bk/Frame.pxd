# distutils: language = c++
from Atom cimport *
from AtomMask cimport *
from Box cimport *


cdef extern from "Frame.h": 
    cdef cppclass _Frame "Frame":
        _Frame() 
        #~_Frame() 
        _Frame(int)
        _Frame(vector [_Atom] const &)
        _Frame(const _Frame&, const _AtomMask&)
        _Frame(const _Frame &)
        _Frame & operator =(_Frame)
        void SetFromCRD(const CRDtype&, int, int, bint)
        void SetFromCRD(const CRDtype&, const _AtomMask&, int, int, bint)
        CRDtype ConvertToCRD(int, bint)const 
        void print_AtomCoord(int)const 
        void Info(const char *)const 
        void Clear_Atoms() 
        void AddXYZ(const double *)
        void Add_Vec3(_Vec3 const &)
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
        int Setup_FrameM(vector [_Atom] const &)
        int Setup_FrameXM(vector [double] const &, vector [double] const &)
        int Setup_FrameV(vector [_Atom] const &, bint, int)
        int Setup_FrameFromMask(const _AtomMask&, vector [Atom] const &)
        void SetCoordinates(const _Frame&, const _AtomMask&)
        void SetCoordinates(const _Frame&)
        void Set_Frame(const _Frame&, const _AtomMask&)
        void SetCoordinatesByMap(const _Frame&, vector [int]const &)
        void SetReferenceByMap(const _Frame&, vector [int]const &)
        void SetTargetByMap(const _Frame&, vector [int]const &)
        void ZeroCoords() 
        _Frame & operator + =(const _Frame &)
        _Frame & operator - =(const _Frame &)
        _Frame & operator * =(const _Frame &)
        const _Frame operator *(const _Frame &)const 
        const _Frame operator -(const _Frame &)const 
        int Divide(const _Frame&, double)
        void Divide(double)
        void AddByMask(const _Frame&, const _AtomMask&)
        inline bint CheckCoordsInvalid() const 
        inline _Vec3 VCenterOfMass(const _AtomMask&)const 
        inline _Vec3 VGeometricCenter(const _AtomMask&)const 
        inline _Vec3 VCenterOfMass(int, int)const 
        inline _Vec3 VGeometricCenter(int, int)const 
        inline void Translate(_Vec3 const &, int, int)
        inline void Translate(_Vec3 const &, int)
        inline void Translate(_Vec3 const &)
        inline void NegTranslate(_Vec3 const &)
        inline void Rotate(_Matrix_3x3 const &)
        inline void Rotate(_Matrix_3x3 const &, const _AtomMask&)
        inline void Trans_Rot_Trans(_Vec3 const &, _Matrix_3x3 const &, _Vec3 const &)
        void Scale(const _AtomMask&, double, double, double)
        void Center(const _AtomMask&, CenterMode, _Vec3 const &, bint)
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
