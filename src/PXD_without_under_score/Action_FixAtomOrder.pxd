# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_FixAtomOrder.h": 
    cdef cppclass Action_FixAtomOrder "Action_FixAtomOrder":
        Action_FixAtomOrder() 
        #~Action_FixAtomOrder() 
        DispatchObject * Alloc() 
        void Help() 
