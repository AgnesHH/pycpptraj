# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *


cdef extern from "Action_Volmap.h": 
    cdef cppclass _Action_Volmap "Action_Volmap":
        _Action_Volmap() 
        _DispatchObject * Alloc() 
        void Help() 
