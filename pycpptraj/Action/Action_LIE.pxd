# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_LIE.h": 
    cdef cppclass _Action_LIE "Action_LIE":
        _Action_LIE() 
        _DispatchObject * Alloc() 
        void Help() 
