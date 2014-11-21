# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Radial.h": 
    cdef cppclass Action_Radial "Action_Radial":
        Action_Radial() 
        #~Action_Radial() 
        DispatchObject * Alloc() 
        void Help() 
