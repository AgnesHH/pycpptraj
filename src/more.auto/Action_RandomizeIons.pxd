# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_RandomizeIons.h": 
    cdef cpplass _Action_RandomizeIons "Action_RandomizeIons":
        _Action_RandomizeIons() 
        static _DispatchObject * Alloc() 
        static void Help() 
