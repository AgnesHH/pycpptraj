# distutils: language = c++
from libcpp.vector cimport vector
from Atom cimport *
from AtomMask cimport *
from Box cimport *


cdef extern from "Frame.h": 
    ctypedef vector[float] CRDtype
    # Frame.h
    ctypedef enum CenterMode "Frame::CenterMode":
        ORIGIN "Frame::ORIGIN"
        BOXCTR "Frame::BOXCTR"
        POINT "Frame::POINT"
    cdef cppclass Frame "Frame":
        Frame() 
        #~Frame() 
        Frame(int)
        Frame(const vector[Atom]&)
        Frame(const Frame&, const AtomMask&)
        Frame(const Frame&)
        #Frame& operator =(Frame)
        void SetFromCRD(const CRDtype&, int, int, bint)
        void SetFromCRD(const CRDtype&, const AtomMask&, int, int, bint)
        CRDtype ConvertToCRD(int, bint) const 
        void printAtomCoord(int) const 
        void Info(const char *) const 
        void ClearAtoms() 
        void AddXYZ(const double *)
        void AddVec3(const Vec3&)
        void SwapAtoms(int, int)
        double& operator[](int idx)
        const double& operator[](int idx) const 
        bint empty() const 
        bint HasVelocity() const 
        int Natom() const 
        int size() const 
        int NrepDims() const 
        double Temperature() const 
        const double * XYZ(int atnum) const 
        const double * CRD(int idx) const 
        const double * VXYZ(int atnum) const 
        double Mass(int atnum) const 
        const Box& BoxCrd() const 
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
        inline void SetBoxAngles(const double *)
        int SetupFrame(int)
        int SetupFrameM(const vector[Atom]&)
        int SetupFrameXM(const vector[double]&, const vector[double]&)
        int SetupFrameV(const vector[Atom]&, bint, int)
        int SetupFrameFromMask(const AtomMask&, const vector[Atom]&)
        void SetCoordinates(const Frame&, const AtomMask&)
        void SetCoordinates(const Frame&)
        void SetFrame(const Frame&, const AtomMask&)
        void SetCoordinatesByMap(const Frame&, const vector[int]&)
        void SetReferenceByMap(const Frame&, const vector[int]&)
        void SetTargetByMap(const Frame&, const vector[int]&)
        void ZeroCoords() 
        #Frame& operator + =(const Frame&)
        #Frame& operator - =(const Frame&)
        #Frame& operator * =(const Frame&)
        const Frame operator *(const Frame&) const 
        const Frame operator -(const Frame&) const 
        int Divide(const Frame&, double)
        void Divide(double)
        void AddByMask(const Frame&, const AtomMask&)
        inline bint CheckCoordsInvalid() const 
        inline Vec3 VCenterOfMass(const AtomMask&) const 
        inline Vec3 VGeometricCenter(const AtomMask&) const 
        inline Vec3 VCenterOfMass(int, int) const 
        inline Vec3 VGeometricCenter(int, int) const 
        inline void Translate(const Vec3&, int, int)
        inline void Translate(const Vec3&, int)
        inline void Translate(const Vec3&)
        inline void NegTranslate(const Vec3&)
        inline void Rotate(const Matrix_3x3&)
        inline void Rotate(const Matrix_3x3&, const AtomMask&)
        inline void Trans_Rot_Trans(const Vec3&, const Matrix_3x3&, const Vec3&)
        void Scale(const AtomMask&, double, double, double)
        void Center(const AtomMask&, CenterMode, const Vec3&, bint)
        Vec3 CenterOnOrigin(bint)
        double RMSD(Frame&, bint)
        double RMSD(Frame&, Matrix_3x3&, Vec3&, Vec3&, bint)
        double RMSD_CenteredRef(const Frame&, bint)
        double RMSD_CenteredRef(const Frame&, Matrix_3x3&, Vec3&, bint)
        double RMSD_NoFit(const Frame&, bint) const 
        double DISTRMSD(const Frame&) const 
        Vec3 SetAxisOfRotation(int, int)
        Vec3 CalculateInertia(const AtomMask&, Matrix_3x3&) const 
        double CalcTemperature(const AtomMask&, int) const 
