# distutils: language = c++
from libcpp.vector cimport vector
from MapAtom cimport *
from Topology cimport *


cdef extern from "AtomMap.h": 
    cdef cppclass AtomMap "AtomMap":
        AtomMap() 
        MapAtom& operator[](int)
        const MapAtom& operator[](int i) const 
        int Natom() 
        void SetDebug(int)
        int Setup(const Topology&)
        int SetupResidue(const Topology&, int)
        void ResetMapping() 
        bint BondIsRepeated(int, int)
        void DetermineAtomIDs() 
        void MarkAtomComplete(int, bint)
        void CheckForCompleteAtoms() 
        int CheckBonds() 
