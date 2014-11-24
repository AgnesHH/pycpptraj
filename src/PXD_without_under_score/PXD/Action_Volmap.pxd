# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_GridFlt cimport *


cdef extern from "Action_Volmap.h": 
    cdef cppclass Action_Volmap "Action_Volmap":
        Action_Volmap() 
        DispatchObject * Alloc() 
        void Help() 
