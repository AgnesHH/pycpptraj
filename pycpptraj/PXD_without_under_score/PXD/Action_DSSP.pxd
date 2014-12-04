# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_DSSP.h": 
    cdef cppclass Action_DSSP::Residue "Action_DSSP::Residue":
    cdef cppclass Action_DSSP "Action_DSSP":
        Action_DSSP() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_DSSP() 
