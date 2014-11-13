# distutils: language = c++
from Action cimport *
from Trajout cimport *
from DataSet_1D cimport *


cdef extern from "Action_Outtraj.h": 
    cdef cppclass _Action_Outtraj "Action_Outtraj":
        _Action_Outtraj() 
        static _DispatchObject * Alloc() 
        static void Help() 
