# distutils: language = c++
from Action cimport *


cdef extern from "Action_Translate.h": 
    cdef cpplass _Action_Translate "Action_Translate":
        _Action_Translate() 
        static _DispatchObject * Alloc() 
        static void Help() 
