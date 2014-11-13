# distutils: language = c++
from Action cimport *
from DataSet_Vector cimport *


cdef extern from "Action_VelocityAutoCorr.h": 
    cdef cppclass _Action_VelocityAutoCorr "Action_VelocityAutoCorr":
        _Action_VelocityAutoCorr() 
        static _DispatchObject * Alloc() 
        static void Help() 
