# distutils: language = c++
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_Strip.h": 
    cdef cppclass Action_Strip "Action_Strip":
        Action_Strip() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Strip() 
    cdef cppclass Action_Unstrip "Action_Unstrip":
        Action_Unstrip() 
        DispatchObject * Alloc() 
        void Help() 
