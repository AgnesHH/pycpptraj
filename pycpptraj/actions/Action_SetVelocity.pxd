# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from Random cimport *


cdef extern from "Action_SetVelocity.h": 
    cdef cppclass _Action_SetVelocity "Action_SetVelocity" (_Action):
        _Action_SetVelocity() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_SetVelocity (Action):
    cdef _Action_SetVelocity* thisptr

