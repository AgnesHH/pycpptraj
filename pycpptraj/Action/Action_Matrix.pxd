# distutils: language = c++
from Action cimport *
from DataSet_MatrixDbl cimport *
from DataSet_Vector cimport *
from Array1D cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Matrix.h": 
    cdef cppclass _Action_Matrix "Action_Matrix":
        _Action_Matrix() 
        _DispatchObject * Alloc() 
        void Help() 
