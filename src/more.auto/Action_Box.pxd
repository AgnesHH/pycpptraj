# distutils: language = c++
from Action cimport *


cdef extern from "Action_Box.h": 
    cdef cppclass _Action_Box "Action_Box":
        _Action_Box() 
        static _DispatchObject * Alloc() 
        static void Help() 
