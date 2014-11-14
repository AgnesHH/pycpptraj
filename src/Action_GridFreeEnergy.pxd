# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_GridFreeEnergy.h": 
    cdef cppclass _Action_GridFreeEnergy "Action_GridFreeEnergy":
        _Action_GridFreeEnergy() 
        _DispatchObject * Alloc() 
        void Help() 
