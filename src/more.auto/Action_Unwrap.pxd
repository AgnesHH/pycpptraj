# distutils: language = c++
from Action cimport *
from ImageTypes cimport *


cdef extern from "Action_Unwrap.h": 
    cdef cppclass _Action_Unwrap "Action_Unwrap":
        _Action_Unwrap() 
        static _DispatchObject * Alloc() 
        static void Help() 
