# distutils: language = c++
from Action cimport *


cdef extern from "Action_Rotate.h": 
    cdef cppclass _Action_Rotate "Action_Rotate":
        _Action_Rotate() 
        _DispatchObject * Alloc() 
        void Help() 
