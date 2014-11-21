# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_Density.h": 
    cdef cppclass Action_Density "Action_Density":
        Action_Density() 
        DispatchObject * Alloc() 
        void Help() 
