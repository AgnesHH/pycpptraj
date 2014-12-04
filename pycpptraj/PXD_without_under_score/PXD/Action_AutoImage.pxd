# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_AutoImage.h": 
    cdef cppclass Action_AutoImage "Action_AutoImage":
        Action_AutoImage() 
        DispatchObject * Alloc() 
        void Help() 
