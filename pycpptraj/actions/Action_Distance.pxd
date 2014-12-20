# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Distance.h": 
    cdef cppclass _Action_Distance "Action_Distance" (_Action):
        _Action_Distance() 
        _DispatchObject * Alloc() 
        void Help() 
        int NOE_Args(_ArgList& argIn, double&, double&, double&)


cdef class Action_Distance (Action):
    cdef _Action_Distance* thisptr

