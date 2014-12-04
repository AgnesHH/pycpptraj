# distutils: language = c++
from Action cimport *


cdef extern from "Action_Rotate.h": 
    cdef cppclass Action_Rotate "Action_Rotate":
        Action_Rotate() 
        DispatchObject * Alloc() 
        void Help() 
