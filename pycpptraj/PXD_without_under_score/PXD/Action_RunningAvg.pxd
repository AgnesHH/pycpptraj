# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_RunningAvg.h": 
    cdef cppclass Action_RunningAvg "Action_RunningAvg":
        Action_RunningAvg() 
        DispatchObject * Alloc() 
        void Help() 
