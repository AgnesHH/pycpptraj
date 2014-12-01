# distutils: language = c++
from Action cimport *
from Array1D cimport *


cdef extern from "Action_FilterByData.h": 
    cdef cppclass _Action_FilterByData "Action_FilterByData":
        _Action_FilterByData() : maxmin_(0)
        _DispatchObject * Alloc() 
        void Help() 
