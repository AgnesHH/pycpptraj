# distutils: language = c++
from libcpp.string cimport string
from Atom cimport *


cdef extern from "MapAtom.h": 
    cdef cppclass MapAtom "MapAtom":
        MapAtom() 
        MapAtom(const MapAtom&)
        MapAtom(const Atom&)
        #MapAtom& operator =(const MapAtom&)
        bint IsChiral() const 
        bint BoundToChiral() const 
        bint IsMapped() const 
        bint Complete() const 
        bint IsUnique() const 
        const string& AtomID() const 
        const string& Unique() const 
        int Nduplicated() const 
        char CharName() const 
        void IsDuplicated() 
        void SetMapped() 
        void SetComplete() 
        void SetChiral() 
        void SetBoundToChiral() 
        void SetAtomID(const string& s)
        void SetUnique(const string& s)
        void SetNotMapped() 
        void SetNotComplete() 
        void SetNotChiral() 
