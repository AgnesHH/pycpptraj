# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from AxisType cimport *
from Range cimport *
from DataSet_1D cimport *


cdef extern from "Action_NAstruct.h": 
    cdef cppclass Action_NAstruct "Action_NAstruct":
        Action_NAstruct() 
        #~Action_NAstruct() 
        DispatchObject * Alloc() 
        void Help() 
