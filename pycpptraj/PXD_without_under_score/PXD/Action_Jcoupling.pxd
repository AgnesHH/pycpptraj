# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_Jcoupling.h": 
    cdef cppclass Action_Jcoupling "Action_Jcoupling":
        Action_Jcoupling() 
        #~Action_Jcoupling() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_Jcoupling::karplusConstant "Action_Jcoupling::karplusConstant":
    cdef cppclass Action_Jcoupling::jcouplingInfo "Action_Jcoupling::jcouplingInfo":
