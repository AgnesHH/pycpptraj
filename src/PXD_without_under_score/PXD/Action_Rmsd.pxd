# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Range cimport *
from ReferenceAction cimport *
from DataSet_1D cimport *


cdef extern from "Action_Rmsd.h": 
    cdef cppclass Action_Rmsd "Action_Rmsd":
        Action_Rmsd() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_Rmsd::perResType "Action_Rmsd::perResType":
