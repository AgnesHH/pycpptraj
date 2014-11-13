# distutils: language = c++
from Action cimport *
from DataSet_Modes cimport *
from ActionFrameCounter cimport *
from Array1D cimport *


cdef extern from "Action_Projection.h": 
    cdef cpplass _Action_Projection "Action_Projection":
        _Action_Projection() 
        static _DispatchObject * Alloc() 
        static void Help() 
