# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Trajout cimport *


cdef extern from "Action_LESsplit.h": 
    cdef cppclass Action_LESsplit "Action_LESsplit":
        Action_LESsplit() : lesAverage_(false ), lesSplit_(false ), lesParm_(0)
        #~Action_LESsplit() 
        DispatchObject * Alloc() 
        void Help() 
