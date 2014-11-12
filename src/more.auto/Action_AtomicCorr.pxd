# distutils: language = c++
from Action cimport *


cdef extern from "Action_AtomicCorr.h": 
    cdef cpplass _Action_AtomicCorr "Action_AtomicCorr":
        _Action_AtomicCorr() 
        static _DispatchObject * Alloc() 
        static void Help() 
