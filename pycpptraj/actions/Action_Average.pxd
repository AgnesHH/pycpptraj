# distutils: language = c++
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Average.h": 
    cdef cppclass _Action_Average "Action_Average":
        _Action_Average() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Average() 
