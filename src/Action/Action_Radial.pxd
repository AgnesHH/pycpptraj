# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Radial.h": 
    cdef cppclass _Action_Radial "Action_Radial":
        _Action_Radial() 
        #~_Action_Radial() 
        _DispatchObject * Alloc() 
        void Help() 
