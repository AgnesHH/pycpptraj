# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_OrderParameter.h": 
    cdef cppclass _Action_OrderParameter "Action_OrderParameter":
        _Action_OrderParameter() 
        static _DispatchObject * Alloc() 
        static void Help() 