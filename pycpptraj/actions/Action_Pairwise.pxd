# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from PDBfile cimport *
from DataSet_MatrixDbl cimport *


cdef extern from "Action_Pairwise.h": 
    cdef cppclass _Action_Pairwise "Action_Pairwise" (_Action):
        _Action_Pairwise() 
        _DispatchObject * Alloc() 
        void Help() 


    cdef cppclass _Action_Pairwise::NonbondEnergyType "Action_Pairwise::NonbondEnergyType" (_Action):


cdef class Action_Pairwise (Action):
    cdef _Action_Pairwise* thisptr

cdef class Action_Pairwise::NonbondEnergyType (Action):
    cdef _Action_Pairwise::NonbondEnergyType* thisptr

