# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_PairDist.h": 
    cdef cpplass _Action_PairDist "Action_PairDist":
        _Action_PairDist() 
        static _DispatchObject * Alloc() 
        static void Help() 
