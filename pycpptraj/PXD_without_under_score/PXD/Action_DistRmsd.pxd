# distutils: language = c++
from Action cimport *
from ReferenceAction cimport *


cdef extern from "Action_DistRmsd.h": 
    cdef cppclass Action_DistRmsd "Action_DistRmsd":
        Action_DistRmsd() 
        DispatchObject * Alloc() 
        void Help() 
