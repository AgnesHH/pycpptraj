# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from BufferedLine cimport *


cdef extern from "Action_NMRrst.h": 
    cdef cppclass Action_NMRrst::noeDataType "Action_NMRrst::noeDataType":
    cdef cppclass Action_NMRrst "Action_NMRrst":
        Action_NMRrst() 
        DispatchObject * Alloc() 
        void Help() 
