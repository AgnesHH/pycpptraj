# distutils: language = c++
from Action cimport *


cdef extern from "Action_MRT.h": 
    cdef cppclass _Action_MRT "Action_MRT":
        _Action_MRT() 
        static _DispatchObject * Alloc() 
        static void Help() 
