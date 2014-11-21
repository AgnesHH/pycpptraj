# distutils: language = c++
from Action cimport *
from ReferenceAction cimport *
from SymmetricRmsdCalc cimport *


cdef extern from "Action_SymmetricRmsd.h": 
    cdef cppclass Action_SymmetricRmsd "Action_SymmetricRmsd":
        Action_SymmetricRmsd() 
        DispatchObject * Alloc() 
        void Help() 
