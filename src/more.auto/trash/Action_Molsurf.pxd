# distutils: language = c++
from Action cimport *
from molsurf cimport *


cdef extern from "Action_Molsurf.h": 
    cdef cpplass _Action_Molsurf "Action_Molsurf":
        _Action_Molsurf() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Molsurf() 
