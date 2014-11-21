# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_PairDist.h": 
    cdef cppclass Action_PairDist "Action_PairDist":
        Action_PairDist() 
        DispatchObject * Alloc() 
        void Help() 
