# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_AtomicCorr.h": 
    cdef cppclass Action_AtomicCorr "Action_AtomicCorr":
        Action_AtomicCorr() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_AtomicCorr::AtomVector "Action_AtomicCorr::AtomVector":
        AtomVector() : idx_(0)
        AtomVector(const string& sIn, int idxIn): lbl_(sIn ), idx_(idxIn)
        int operator -(const AtomVector& rhs)
        bint empty() 
        size_t size() 
        void push_back(float fval)
        const string& Label() 
        Vec3 VXYZ(int idx)
