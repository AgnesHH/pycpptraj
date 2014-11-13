# distutils: language = c++
from Action cimport *
from AxisType cimport *
from Range cimport *
from DataSet_1D cimport *


cdef extern from "Action_NAstruct.h": 
    cdef cppclass _Action_NAstruct "Action_NAstruct":
        _Action_NAstruct() 
        #~_Action_NAstruct() 
        static _DispatchObject * Alloc() 
        static void Help() 
