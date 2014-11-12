# distutils: language = c++
from Action cimport *
from DataSet_MatrixDbl cimport *
from DataSet_Vector cimport *
from Array1D cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Matrix.h": 
    cdef cpplass _Action_Matrix "Action_Matrix":
        _Action_Matrix() 
        static _DispatchObject * Alloc() 
        static void Help() 
