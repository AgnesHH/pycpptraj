# distutils: language = c++
from Action cimport *
from DataSet_Vector cimport *
from TrajectoryFile cimport *


cdef extern from "Action_Vector.h": 
    cdef cppclass _Action_Vector "Action_Vector":
        _Action_Vector() 
        #~_Action_Vector() 
        _DispatchObject * Alloc() 
        void Help() 
