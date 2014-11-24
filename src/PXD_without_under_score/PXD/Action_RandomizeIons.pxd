# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_RandomizeIons.h": 
    cdef cppclass Action_RandomizeIons "Action_RandomizeIons":
        Action_RandomizeIons() 
        DispatchObject * Alloc() 
        void Help() 
