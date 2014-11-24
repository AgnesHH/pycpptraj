# distutils: language = c++
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_Bounds.h": 
    cdef cppclass Action_Bounds "Action_Bounds":
        Action_Bounds() 
        DispatchObject * Alloc() 
        void Help() 
