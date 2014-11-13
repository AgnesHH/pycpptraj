# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_Grid.h": 
    cdef cppclass _Action_Grid "Action_Grid":
        _Action_Grid() 
        static _DispatchObject * Alloc() 
        static void Help() 
