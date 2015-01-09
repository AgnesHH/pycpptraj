# distutils: language = c++
from pycpptraj.actions.Action cimport _Action, Action


cdef extern from "Action_Box.h": 
    cdef cppclass _Action_Box "Action_Box" (_Action):
        _Action_Box() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Box (Action):
    cdef _Action_Box* thisptr

