# distutils: language = c++
from Topology cimport *

cdef extern from "AtomMap.h":
    cdef cppclass _AtomMap "AtomMap":
        _AtomMap()
        #MapAtom& operator[](int)
        #const MapAtom& operator[](int i)

        int Natom()
        void SetDebug(int)
        int Setup(_Topology&)
        int SetupResidue(_Topology&, int)
        void ResetMapping()
        bint BondIsRepeated(int, int)
        void DetermineAtomIDs()
        void MarkAtomComplete(int, bint)
        void CheckForCompleteAtoms()
        int CheckBonds()

