# distutils: language = c++
from Action cimport *
from Array1D cimport *


cdef extern from "Action_FilterByData.h": 
    cdef cpplass _Action_FilterByData "Action_FilterByData":
        _Action_FilterByData() : maxmin_(0)
        static _DispatchObject * Alloc() 
        static void Help() 
