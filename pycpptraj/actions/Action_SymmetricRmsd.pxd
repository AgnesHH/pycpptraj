# distutils: language = c++
from Action cimport *
#from ReferenceAction cimport *
#from SymmetricRmsdCalc cimport *


cdef extern from "Action_SymmetricRmsd.h": 
    cdef cppclass _Action_SymmetricRmsd "Action_SymmetricRmsd" (_Action):
        _Action_SymmetricRmsd() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_SymmetricRmsd (Action):
    cdef _Action_SymmetricRmsd* thisptr

