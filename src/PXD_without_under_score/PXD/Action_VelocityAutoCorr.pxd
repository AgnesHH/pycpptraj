# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from DataSet_Vector cimport *


cdef extern from "Action_VelocityAutoCorr.h": 
    cdef cppclass Action_VelocityAutoCorr "Action_VelocityAutoCorr":
        Action_VelocityAutoCorr() 
        DispatchObject * Alloc() 
        void Help() 
