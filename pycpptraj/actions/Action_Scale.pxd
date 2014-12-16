# distutils: language = c++
from Action cimport *


cdef extern from "Action_Scale.h": 
    cdef cppclass _Action_Scale "Action_Scale":
        _Action_Scale() 
        _DispatchObject * Alloc() 
        void Help() 
