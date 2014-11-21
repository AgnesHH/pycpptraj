# distutils: language = c++
from Action cimport *


cdef extern from "Action_Center.h": 
    cdef cppclass Action_Center "Action_Center":
        Action_Center() 
        DispatchObject * Alloc() 
        void Help() 
