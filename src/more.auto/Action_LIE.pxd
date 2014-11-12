# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_LIE.h": 
    cdef cpplass _Action_LIE "Action_LIE":
        _Action_LIE() 
        static _DispatchObject * Alloc() 
        static void Help() 
