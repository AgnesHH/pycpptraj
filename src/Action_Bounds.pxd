# distutils: language = c++
from Action cimport *


cdef extern from "Action_Bounds.h": 
    cdef cppclass _Action_Bounds "Action_Bounds":
        _Action_Bounds() 
        static _DispatchObject * Alloc() 
        static void Help() 
