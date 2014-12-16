# distutils: language = c++
from Action cimport *


cdef extern from "Action_AtomicCorr.h": 
    cdef cppclass _Action_AtomicCorr "Action_AtomicCorr":
        _Action_AtomicCorr() 
        _DispatchObject * Alloc() 
        void Help() 
