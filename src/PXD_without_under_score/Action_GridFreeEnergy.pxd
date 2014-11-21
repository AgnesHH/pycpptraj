# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_GridFreeEnergy.h": 
    cdef cppclass Action_GridFreeEnergy "Action_GridFreeEnergy":
        Action_GridFreeEnergy() 
        DispatchObject * Alloc() 
        void Help() 
