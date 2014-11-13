# distutils: language = c++
from Action cimport *


cdef extern from "Action_Temperature.h": 
    cdef cpplass _Action_Temperature "Action_Temperature":
        _Action_Temperature() 
        static _DispatchObject * Alloc() 
        static void Help() 
