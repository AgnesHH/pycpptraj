# distutils: language = c++
from Action cimport *
from ReferenceAction cimport *
from SymmetricRmsdCalc cimport *


cdef extern from "Action_SymmetricRmsd.h": 
    cdef cpplass _Action_SymmetricRmsd "Action_SymmetricRmsd":
        _Action_SymmetricRmsd() 
        static _DispatchObject * Alloc() 
        static void Help() 
