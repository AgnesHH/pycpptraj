# distutil: language = c++
from libcpp.string cimport string
from Atom cimport *
cdef extern from "MapAtom.h":
    cdef cppclass _MapAtom "MapAtom":
        _MapAtom()
        _MapAtom(const _MapAtom&)
        _MapAtom(const Atom&)
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

cdef class MapAtom:
    cdef _MapAtom* thisptr
