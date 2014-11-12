# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *


cdef extern from "Action_Volmap.h": 
    cdef cpplass _Action_Volmap "Action_Volmap":
        _Action_Volmap() 
        static _DispatchObject * Alloc() 
        static void Help() 
