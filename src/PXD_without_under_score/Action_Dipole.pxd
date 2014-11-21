# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_Dipole.h": 
    cdef cppclass Action_Dipole "Action_Dipole":
        Action_Dipole() 
        DispatchObject * Alloc() 
        void Help() 
