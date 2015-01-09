# distutils: language = c++
#from libcpp.string cimport string
from pycpptraj.actions.Action cimport _Action, Action
from ActionFrameCounter cimport *


cdef extern from "Action_AtomicFluct.h": 
    cdef cppclass _Action_AtomicFluct "Action_AtomicFluct" (_Action):
        _Action_AtomicFluct() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_AtomicFluct (Action):
    cdef _Action_AtomicFluct* thisptr

