# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Closest.h": 
    cdef cppclass _Action_Closest "Action_Closest":
        _Action_Closest() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Closest() 
