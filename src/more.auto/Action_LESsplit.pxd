# distutils: language = c++
from Action cimport *
from Trajout cimport *


cdef extern from "Action_LESsplit.h": 
    cdef cpplass _Action_LESsplit "Action_LESsplit":
        _Action_LESsplit() : lesAverage_(false ), lesSplit_(false ), lesParm_(0)
        #~_Action_LESsplit() 
        static _DispatchObject * Alloc() 
        static void Help() 
