# distutils: language = c++
from Action cimport *


cdef extern from "Action_RunningAvg.h": 
    cdef cppclass _Action_RunningAvg "Action_RunningAvg":
        _Action_RunningAvg() 
        _DispatchObject * Alloc() 
        void Help() 
