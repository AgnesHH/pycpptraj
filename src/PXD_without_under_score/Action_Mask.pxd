# distutils: language = c++
from libcpp.string cimport string
from Action cimport *
from TrajectoryFile cimport *


cdef extern from "Action_Mask.h": 
    cdef cppclass Action_Mask "Action_Mask":
        Action_Mask() 
        DispatchObject * Alloc() 
        void Help() 
