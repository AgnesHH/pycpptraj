# distutils: language = c++
from Action cimport *


cdef extern from "Action_Translate.h": 
    cdef cppclass _Action_Translate "Action_Translate":
        _Action_Translate() 
        _DispatchObject * Alloc() 
        void Help() 
