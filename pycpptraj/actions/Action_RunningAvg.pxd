# distutils: language = c++
#from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_RunningAvg.h": 
    cdef cppclass _Action_RunningAvg "Action_RunningAvg" (_Action):
        _Action_RunningAvg() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_RunningAvg (Action):
    cdef _Action_RunningAvg* thisptr

