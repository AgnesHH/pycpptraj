# distutils: language = c++
from Action cimport *


cdef extern from "Action_RunningAvg.h": 
    cdef cppclass _Action_RunningAvg "Action_RunningAvg":
        _Action_RunningAvg() 
        static _DispatchObject * Alloc() 
        static void Help() 
