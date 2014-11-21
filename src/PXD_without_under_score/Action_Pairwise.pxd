# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_Pairwise.h": 
    cdef cppclass Action_Pairwise "Action_Pairwise":
        Action_Pairwise() 
        #~Action_Pairwise() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_Pairwise::NonbondEnergyType "Action_Pairwise::NonbondEnergyType":
