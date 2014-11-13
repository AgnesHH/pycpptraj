# distutils: language = c++
from Topology cimport *


cdef extern from "AxisType.h": 
    cdef cppclass _NA_Base "NA_Base":
        _NA_Base() 
        _NA_Base(const _NA_Base &)
        _NA_Base & operator =(const _NA_Base &)
        static NAType ID_BaseFromName(const _NameType&)
        _NA_Base(const _Topology&, int, NAType)
        void SetInput_Frame(const _Frame&)
        void Print_AtomNames() const 
        NAType Type() const 
        int ResNum() const 
        char BaseChar() const 
        const _Frame& Ref() const 
        const _Frame& Input() const 
        const _AtomMask& InputFitMask() const 
        const _AtomMask& RefFitMask() const 
        const char * _AtomName(int i)const 
        bint HasPatom() const 
        bint HasO4atom() const 
        bint HasSugar_Atoms() const 
        const char * ResName() const 
        const char * RefName(int i)const 
        int HBidx(int i)const 
        const double * HBxyz(int i)const 
        const double * Pxyz() const 
        const double * O4xyz() const 
        const double * C1xyz() const 
        const double * C2xyz() const 
        const double * C3xyz() const 
        const double * C4xyz() const 
