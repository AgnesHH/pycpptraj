# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Topology cimport *
from Hungarian cimport *
from AtomMap cimport *


cdef extern from "SymmetricRmsdCalc.h": 
    cdef cppclass SymmetricRmsdCalc "SymmetricRmsdCalc":
        SymmetricRmsdCalc() 
        SymmetricRmsdCalc(const AtomMask&, bint, bint, const Topology&, int)
        int InitSymmRMSD(bint, bint, int)
        int SetupSymmRMSD(const Topology&, const AtomMask&, bint)
        double SymmRMSD(const Frame&, Frame&)
        double SymmRMSD_CenteredRef(const Frame&, const Frame&)
        bint Fit() const 
        bint UseMass() const 
        const Matrix_3x3& RotMatrix() const 
        const Vec3& TgtTrans() const 
        const Iarray& AMap() const 
