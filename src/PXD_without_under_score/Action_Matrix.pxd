# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_MatrixDbl cimport *
from DataSet_Vector cimport *
from Array1D cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_Matrix.h": 
    cdef cppclass Action_Matrix "Action_Matrix":
        Action_Matrix() 
        DispatchObject * Alloc() 
        void Help() 
