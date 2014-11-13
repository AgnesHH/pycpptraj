# distutils: language = c++
from Action cimport *


cdef extern from "Action_Temperature.h": 
    cdef cppclass _Action_Temperature "Action_Temperature":
        _Action_Temperature() 
        _DispatchObject * Alloc() 
        void Help() 
