# distutils: language = c++
from Topology cimport *

cdef extern from "AtomMap.h":
    cdef cppclass AtomMap:
        AtomMap()
        #MapAtom& operator[](int)
        #const MapAtom& operator[](int i)

        int Natom()
        void SetDebug(int)
        int Setup(Topology&)
        int SetupResidue(Topology&, int)
        void ResetMapping()
        bint BondIsRepeated(int, int)
        void DetermineAtomIDs()
        void MarkAtomComplete(int, bint)
        void CheckForCompleteAtoms()
        int CheckBonds()

