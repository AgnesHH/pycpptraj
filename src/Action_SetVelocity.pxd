# distutils: language = c++
from Action cimport *
from Random cimport *


cdef extern from "Action_SetVelocity.h": 
    cdef cppclass _Action_SetVelocity "Action_SetVelocity":
        _Action_SetVelocity() 
        static _DispatchObject * Alloc() 
        static void Help() 
