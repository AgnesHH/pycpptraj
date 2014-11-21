# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_Vector cimport *
from TrajectoryFile cimport *


cdef extern from "Action_Vector.h": 
    cdef cppclass Action_Vector "Action_Vector":
        Action_Vector() 
        #~Action_Vector() 
        DispatchObject * Alloc() 
        void Help() 
