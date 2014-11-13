# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Closest.h": 
    cdef cpplass _Action_Closest "Action_Closest":
        _Action_Closest() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Closest() 
