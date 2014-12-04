# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_OrderParameter.h": 
    cdef cppclass Action_OrderParameter "Action_OrderParameter":
        Action_OrderParameter() 
        DispatchObject * Alloc() 
        void Help() 
