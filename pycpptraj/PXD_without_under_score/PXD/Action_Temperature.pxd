# distutils: language = c++
from Action cimport *


cdef extern from "Action_Temperature.h": 
    cdef cppclass Action_Temperature "Action_Temperature":
        Action_Temperature() 
        DispatchObject * Alloc() 
        void Help() 
