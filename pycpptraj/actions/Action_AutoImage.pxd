# distutils: language = c++
from Action cimport *


cdef extern from "Action_AutoImage.h": 
    cdef cppclass _Action_AutoImage "Action_AutoImage":
        _Action_AutoImage() 
        _DispatchObject * Alloc() 
        void Help() 