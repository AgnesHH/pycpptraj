# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Watershell.h": 
    cdef cppclass _Action_Watershell "Action_Watershell":
        _Action_Watershell() 
        #~_Action_Watershell() 
        static _DispatchObject * Alloc() 
        static void Help() 
