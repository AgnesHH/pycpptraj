# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_RandomizeIons.h": 
    cdef cppclass _Action_RandomizeIons "Action_RandomizeIons":
        _Action_RandomizeIons() 
        _DispatchObject * Alloc() 
        void Help() 
