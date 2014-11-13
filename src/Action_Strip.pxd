# distutils: language = c++
from Action cimport *


cdef extern from "Action_Strip.h": 
    cdef cppclass _Action_Strip "Action_Strip":
        _Action_Strip() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Strip() 
