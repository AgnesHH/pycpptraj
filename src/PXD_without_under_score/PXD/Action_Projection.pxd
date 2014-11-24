# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from DataSet_Modes cimport *
from ActionFrameCounter cimport *
from Array1D cimport *


cdef extern from "Action_Projection.h": 
    cdef cppclass Action_Projection "Action_Projection":
        Action_Projection() 
        DispatchObject * Alloc() 
        void Help() 
