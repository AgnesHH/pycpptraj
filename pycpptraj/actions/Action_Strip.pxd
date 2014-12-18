# distutils: language = c++
from Action cimport *


cdef extern from "Action_Strip.h": 
    cdef cppclass _Action_Strip "Action_Strip":
        _Action_Strip() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Strip() 

cdef class Action_Strip(Action):
    cdef _Action_Strip* thisptr

