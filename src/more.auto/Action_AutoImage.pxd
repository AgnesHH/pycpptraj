# distutils: language = c++
from Action cimport *


cdef extern from "Action_AutoImage.h": 
    cdef cpplass _Action_AutoImage "Action_AutoImage":
        _Action_AutoImage() 
        static _DispatchObject * Alloc() 
        static void Help() 
