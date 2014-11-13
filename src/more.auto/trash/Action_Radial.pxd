# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Radial.h": 
    cdef cpplass _Action_Radial "Action_Radial":
        _Action_Radial() 
        #~_Action_Radial() 
        static _DispatchObject * Alloc() 
        static void Help() 
