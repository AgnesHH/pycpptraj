# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from DataSet_integer cimport *


cdef extern from "Action_Hbond.h": 
    cdef cppclass _Action_Hbond "Action_Hbond" (_Action):
        _Action_Hbond() 
        _DispatchObject * Alloc() 
        void Help() 


    cdef cppclass _Action_Hbond::HbondType "Action_Hbond::HbondType" (_Action):


    cdef cppclass _Action_Hbond::hbond_cmp "Action_Hbond::hbond_cmp" (_Action):
        inline bint operator()(const HbondType& first, const HbondType& second) const 


    cdef cppclass _Action_Hbond::bridge_cmp "Action_Hbond::bridge_cmp" (_Action):
        inline bint operator()(pair[set[int], int] const& first, pair[set[int], int] const& second) const 


cdef class Action_Hbond (Action):
    cdef _Action_Hbond* thisptr

cdef class Action_Hbond::HbondType (Action):
    cdef _Action_Hbond::HbondType* thisptr

cdef class Action_Hbond::hbond_cmp (Action):
    cdef _Action_Hbond::hbond_cmp* thisptr

cdef class Action_Hbond::bridge_cmp (Action):
    cdef _Action_Hbond::bridge_cmp* thisptr

