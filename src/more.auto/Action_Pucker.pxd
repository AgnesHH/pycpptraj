# distutils: language = c++
from Action cimport *


cdef extern from "Action_Pucker.h": 
    cdef cpplass _Action_Pucker "Action_Pucker":
        _Action_Pucker() 
        static _DispatchObject * Alloc() 
        static void Help() 
