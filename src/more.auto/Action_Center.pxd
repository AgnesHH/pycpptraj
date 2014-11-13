# distutils: language = c++
from Action cimport *


cdef extern from "Action_Center.h": 
    cdef cppclass _Action_Center "Action_Center":
        _Action_Center() 
        static _DispatchObject * Alloc() 
        static void Help() 
