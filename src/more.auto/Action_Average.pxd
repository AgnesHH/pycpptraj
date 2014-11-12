# distutils: language = c++
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Average.h": 
    cdef cpplass _Action_Average "Action_Average":
        _Action_Average() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Average() 
