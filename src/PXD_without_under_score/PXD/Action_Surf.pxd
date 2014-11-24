# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_Surf.h": 
    cdef cppclass Action_Surf::SurfInfo "Action_Surf::SurfInfo":
    cdef cppclass Action_Surf "Action_Surf":
        Action_Surf() 
        DispatchObject * Alloc() 
        void Help() 
