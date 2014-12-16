# distutils: language = c++
from Action cimport *


cdef extern from "Action_Surf.h": 
    cdef cppclass _Action_Surf "Action_Surf":
        _Action_Surf() 
        _DispatchObject * Alloc() 
        void Help() 
