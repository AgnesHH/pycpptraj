# distutils: language = c++
from Action cimport *


cdef extern from "Action_Radgyr.h": 
    cdef cppclass _Action_Radgyr "Action_Radgyr":
        _Action_Radgyr() 
        static _DispatchObject * Alloc() 
        static void Help() 
