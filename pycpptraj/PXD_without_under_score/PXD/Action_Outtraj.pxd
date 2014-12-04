# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from Trajout cimport *
from DataSet_1D cimport *


cdef extern from "Action_Outtraj.h": 
    cdef cppclass Action_Outtraj "Action_Outtraj":
        Action_Outtraj() 
        DispatchObject * Alloc() 
        void Help() 
