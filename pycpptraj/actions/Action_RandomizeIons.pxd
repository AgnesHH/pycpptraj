# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from .Action cimport *
from ..ImagedAction cimport *


cdef extern from "Action_RandomizeIons.h": 
    cdef cppclass _Action_RandomizeIons "Action_RandomizeIons" (_Action):
        _Action_RandomizeIons() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_RandomizeIons (Action):
    cdef _Action_RandomizeIons* thisptr

