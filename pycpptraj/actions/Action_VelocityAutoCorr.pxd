# distutils: language = c++
#from libcpp.vector cimport vector
from Action cimport *
#from DataSet_Vector cimport *


cdef extern from "Action_VelocityAutoCorr.h": 
    cdef cppclass _Action_VelocityAutoCorr "Action_VelocityAutoCorr" (_Action):
        _Action_VelocityAutoCorr() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_VelocityAutoCorr (Action):
    cdef _Action_VelocityAutoCorr* thisptr

