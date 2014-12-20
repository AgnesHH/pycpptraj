# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Closest.h": 
    cdef cppclass _Action_Closest "Action_Closest" (_Action):
        _Action_Closest() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Closest() 


    cdef cppclass _Action_Closest::moldist_cmp "Action_Closest::moldist_cmp" (_Action):
        inline bint operator()(const MolDist& first, const MolDist& second) const 


    cdef cppclass _Action_Closest::MolDist "Action_Closest::MolDist" (_Action):


cdef class Action_Closest (Action):
    cdef _Action_Closest* thisptr

cdef class Action_Closest::moldist_cmp (Action):
    cdef _Action_Closest::moldist_cmp* thisptr

cdef class Action_Closest::MolDist (Action):
    cdef _Action_Closest::MolDist* thisptr

