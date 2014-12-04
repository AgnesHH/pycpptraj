# distutils: language = c++
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_MRT.h": 
    cdef cppclass Action_MRT "Action_MRT":
        Action_MRT() 
        DispatchObject * Alloc() 
        void Help() 
