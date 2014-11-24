# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Watershell.h": 
    cdef cppclass Action_Watershell "Action_Watershell":
        Action_Watershell() 
        #~Action_Watershell() 
        DispatchObject * Alloc() 
        void Help() 
