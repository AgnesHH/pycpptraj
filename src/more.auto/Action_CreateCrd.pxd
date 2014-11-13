# distutils: language = c++
from Action cimport *
from DataSet_Coords cimport *


cdef extern from "Action_CreateCrd.h": 
    cdef cppclass _Action_CreateCrd "Action_CreateCrd":
        _Action_CreateCrd() 
        static _DispatchObject * Alloc() 
        static void Help() 
