# distutil: language = c++

from Atom cimport *
cdef extern from "MapAtom.h":
    cdef cppclass _MapAtom "MapAtom(Atom)":
        _MapAtom()
        _MapAtom(const MapAtom&)
        bint IsChiral()
        bint BoundToChiral()
        bint IsMapped()
        bint Complete()
        bint IsUnique()
        const string& AtomID()
        const string& Unique()
        int Nduplicated()
        char CharName()
        void IsDuplicated()
        void SetMapped()
        void SetComplete()
        void SetChiral()
        void SetBoundToChiral()
        void SetAtomID(const string&)
        void SetUnique(const string&)
        void SetNotMapped()
        void SetNotComplete()
        void SetNotChiral()
        
