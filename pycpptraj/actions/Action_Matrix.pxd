# distutils: language = c++
from actions.Action cimport *

cdef extern from "Action_Matrix.h": 
    cdef cppclass _Action_Matrix "Action_Matrix" (_Action):
        _Action_Matrix() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Matrix (Action):
    cdef _Action_Matrix* thisptr

