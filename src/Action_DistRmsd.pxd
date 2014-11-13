# distutils: language = c++
from Action cimport *
from ReferenceAction cimport *


cdef extern from "Action_DistRmsd.h": 
    cdef cppclass _Action_DistRmsd "Action_DistRmsd":
        _Action_DistRmsd() 
        _DispatchObject * Alloc() 
        void Help() 
