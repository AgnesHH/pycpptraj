# distutils: language = c++
from Topology cimport *
from Hungarian cimport *
from AtomMap cimport *


cdef extern from "SymmetricRmsdCalc.h": 
    cdef cpplass _SymmetricRmsdCalc "SymmetricRmsdCalc":
        _SymmetricRmsdCalc() 
        _SymmetricRmsdCalc(const _AtomMask&, bint, bint, const _Topology&, int)
        int InitSymmRMSD(bint, bint, int)
        int SetupSymmRMSD(const _Topology&, const _AtomMask&, bint)
        double SymmRMSD(const _Frame&, _Frame &)
        double SymmRMSD_CenteredRef(const _Frame&, const _Frame&)
        bint Fit() const 
        bint UseMass() const 
        _Matrix_3x3 const & RotMatrix() const 
        _Vec3 const & TgtTrans() const 
        const Iarray& AMap() const 
