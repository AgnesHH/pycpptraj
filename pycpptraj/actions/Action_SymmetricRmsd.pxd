# distutils: language = c++
from pycpptraj.actions.Action cimport _Action, Action
#from ReferenceAction cimport *
#from SymmetricRmsdCalc cimport *


cdef extern from "Action_SymmetricRmsd.h": 
    cdef cppclass _Action_SymmetricRmsd "Action_SymmetricRmsd" (_Action):
        _Action_SymmetricRmsd() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_SymmetricRmsd (Action):
    cdef _Action_SymmetricRmsd* thisptr

