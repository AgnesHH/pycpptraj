# distutils: language = c++
from Action cimport *
from ImageTypes cimport *


cdef extern from "Action_Unwrap.h": 
    cdef cppclass Action_Unwrap "Action_Unwrap":
        Action_Unwrap() 
        DispatchObject * Alloc() 
        void Help() 
