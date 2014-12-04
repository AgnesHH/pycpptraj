# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_Pucker.h": 
    cdef cppclass Action_Pucker "Action_Pucker":
        Action_Pucker() 
        DispatchObject * Alloc() 
        void Help() 
