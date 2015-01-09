# distutils: language = c++
#from libcpp.vector cimport vector
from pycpptraj.actions.Action cimport _Action, Action
#from ImagedAction cimport *
#from OnlineVarT cimport *


cdef extern from "Action_PairDist.h": 
    cdef cppclass _Action_PairDist "Action_PairDist" (_Action):
        _Action_PairDist() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_PairDist (Action):
    cdef _Action_PairDist* thisptr

