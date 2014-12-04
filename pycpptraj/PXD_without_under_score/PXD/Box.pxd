# distutils: language = c++
from Matrix_3x3 cimport *


cdef extern from "Box.h": 
    # Box.h
    ctypedef enum BoxType "Box::BoxType":
        bNOBOX "Box::NOBOX"
        bORTHO "Box::ORTHO"
        bTRUNCOCT "Box::TRUNCOCT"
        bRHOMBIC "Box::RHOMBIC"
        bNONORTHO "Box::NONORTHO"
    cdef cppclass Box "Box":
        Box() 
        Box(const double *)
        Box(const Box&)
        #Box& operator =(const Box&)
        const char * TypeName() const 
        void SetBetaLengths(double, double, double, double)
        void SetBox(const double *)
        void SetTruncOct() 
        void SetNoBox() 
        void SetMissingInfo(const Box&)
        double ToRecip(Matrix_3x3&, Matrix_3x3&) const 
        void SetX(double xin)
        void SetY(double yin)
        void SetZ(double zin)
        void SetAlpha(double ain)
        void SetBeta(double bin)
        void SetGamma(double gin)
        BoxType Type() const 
        double BoxX() const 
        double BoxY() const 
        double BoxZ() const 
        double Alpha() const 
        double Beta() const 
        double Gamma() const 
        bint HasBox() const 
        Vec3 Center() const 
        Vec3 Lengths() const 
        double * boxPtr() 
        const double * boxPtr() const 
        const double& operator[](int idx) const 
        double& operator[](int idx)
