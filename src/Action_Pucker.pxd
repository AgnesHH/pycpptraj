# distutils: language = c++
from Action cimport *


cdef extern from "Action_Pucker.h": 
    cdef cppclass _Action_Pucker "Action_Pucker":
        _Action_Pucker() 
        _DispatchObject * Alloc() 
        void Help() 
