# distutils: language = c++
from MapAtom cimport *
from Topology cimport *


cdef extern from "AtomMap.h": 
    cdef cppclass _AtomMap "AtomMap":
        _AtomMap() 
        _MapAtom& operator[](int)
        const _MapAtom& operator[](int i) const 
        int Natom() 
        void SetDebug(int)
        int Setup(const _Topology&)
        int SetupResidue(const _Topology&, int)
        void ResetMapping() 
        bint BondIsRepeated(int, int)
        void DetermineAtomIDs() 
        void MarkAtomComplete(int, bint)
        void CheckForComplete_Atoms() 
        int CheckBonds() 


cdef class AtomMap:
    cdef _AtomMap* thisptr
