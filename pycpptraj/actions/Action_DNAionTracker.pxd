# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_DNAionTracker.h": 
    cdef cppclass _Action_DNAionTracker "Action_DNAionTracker" (_Action):
        _Action_DNAionTracker() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_DNAionTracker (Action):
    cdef _Action_DNAionTracker* thisptr

