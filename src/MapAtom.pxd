# distutils: language = c++
from Atom cimport *


cdef extern from "MapAtom.h": 
    cdef cppclass _MapAtom "MapAtom":
        _MapAtom() 
        _MapAtom(const _MapAtom&)
        _MapAtom(const _Atom&)
        #_MapAtom& operator =(const _MapAtom&)
        bint IsChiral() const 
        bint BoundToChiral() const 
        bint IsMapped() const 
        bint Complete() const 
        bint IsUnique() const 
        const string& _AtomID() const 
        const string& Unique() const 
        int Nduplicated() const 
        char CharName() const 
        void IsDuplicated() 
        void SetMapped() 
        void SetComplete() 
        void SetChiral() 
        void SetBoundToChiral() 
        void Set_AtomID(const string&)
        void SetUnique(const string&)
        void SetNotMapped() 
        void SetNotComplete() 
        void SetNotChiral() 
