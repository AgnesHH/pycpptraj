# distutils: language = c++
from libcpp.string cimport string
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Average.h": 
    cdef cppclass Action_Average "Action_Average":
        Action_Average() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Average() 
