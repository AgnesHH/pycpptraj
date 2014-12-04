# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from Array1D cimport *


cdef extern from "Action_FilterByData.h": 
    cdef cppclass Action_FilterByData "Action_FilterByData":
        Action_FilterByData() : maxmin_(0)
        DispatchObject * Alloc() 
        void Help() 
