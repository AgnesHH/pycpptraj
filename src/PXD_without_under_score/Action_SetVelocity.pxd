# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from Random cimport *


cdef extern from "Action_SetVelocity.h": 
    cdef cppclass Action_SetVelocity "Action_SetVelocity":
        Action_SetVelocity() 
        DispatchObject * Alloc() 
        void Help() 
