# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Closest.h": 
    cdef cppclass Action_Closest "Action_Closest":
        Action_Closest() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Closest() 
    cdef cppclass Action_Closest::moldist_cmp "Action_Closest::moldist_cmp":
        inline bint operator()(const MolDist& first, const MolDist& second) const 
    cdef cppclass Action_Closest::MolDist "Action_Closest::MolDist":
