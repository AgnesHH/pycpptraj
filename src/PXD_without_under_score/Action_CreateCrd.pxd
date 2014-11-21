# distutils: language = c++
from Action cimport *
from DataSet_Coords cimport *


cdef extern from "Action_CreateCrd.h": 
    cdef cppclass Action_CreateCrd "Action_CreateCrd":
        Action_CreateCrd() 
        DispatchObject * Alloc() 
        void Help() 
