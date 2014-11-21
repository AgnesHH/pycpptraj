# distutils: language = c++
from libcpp.string cimport string
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_Grid.h": 
    cdef cppclass Action_Grid "Action_Grid":
        Action_Grid() 
        DispatchObject * Alloc() 
        void Help() 
