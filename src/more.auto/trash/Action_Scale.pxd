# distutils: language = c++
from Action cimport *


cdef extern from "Action_Scale.h": 
    cdef cpplass _Action_Scale "Action_Scale":
        _Action_Scale() 
        static _DispatchObject * Alloc() 
        static void Help() 
