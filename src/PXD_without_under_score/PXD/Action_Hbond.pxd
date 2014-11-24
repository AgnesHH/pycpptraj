# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from DataSet_integer cimport *


cdef extern from "Action_Hbond.h": 
    cdef cppclass Action_Hbond "Action_Hbond":
        Action_Hbond() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_Hbond::HbondType "Action_Hbond::HbondType":
    cdef cppclass Action_Hbond::hbond_cmp "Action_Hbond::hbond_cmp":
        inline bint operator()(const HbondType& first, const HbondType& second) const 
    cdef cppclass Action_Hbond::bridge_cmp "Action_Hbond::bridge_cmp":
        inline bint operator()(pair[set[int], int] const& first, pair[set[int], int] const& second) const 
