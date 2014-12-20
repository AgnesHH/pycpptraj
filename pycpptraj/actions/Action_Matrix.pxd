# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_MatrixDbl cimport *
from DataSet_Vector cimport *
from Array1D cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Matrix.h": 
    cdef cppclass _Action_Matrix "Action_Matrix" (_Action):
        _Action_Matrix() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Matrix (Action):
    cdef _Action_Matrix* thisptr

