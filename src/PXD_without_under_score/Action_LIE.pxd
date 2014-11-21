# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_LIE.h": 
    cdef cppclass Action_LIE "Action_LIE":
        Action_LIE() 
        DispatchObject * Alloc() 
        void Help() 
