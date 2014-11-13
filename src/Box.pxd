# distutils: language = c++
from Matrix_3x3 cimport *


cdef extern from "Box.h": 
    ctypedef enum BoxType "Box::BoxType":
        NOBOX "Box::NOBOX"
        ORTHO "Box::ORTHO"
        TRUNCOCT "Box::TRUNCOCT"
        RHOMBIC "Box::RHOMBIC"
        NONORTHO "Box::NONORTHO"
    cdef cppclass _Box "Box":
        _Box() 
        _Box(const double *)
        _Box(const _Box &)
        #_Box & operator =(const _Box &)
        const char * TypeName() const 
        void SetBetaLengths(double, double, double, double)
        void Set_Box(const double *)
        void SetTruncOct() 
        void SetNo_Box() 
        void SetMissingInfo(const _Box &)
        double ToRecip(_Matrix_3x3 &, _Matrix_3x3 &)const 
        void SetX(double xin)
        void SetY(double yin)
        void SetZ(double zin)
        void SetAlpha(double ain)
        void SetBeta(double bin)
        void SetGamma(double gin)
        BoxType Type() const 
        double _BoxX() const 
        double _BoxY() const 
        double _BoxZ() const 
        double Alpha() const 
        double Beta() const 
        double Gamma() const 
        bint Has_Box() const 
        _Vec3 Center() const 
        _Vec3 Lengths() const 
        double * boxPtr() 
        const double * boxPtr() const 
        const double& operator [ ](int idx)const 
        double & operator [ ](int idx)
