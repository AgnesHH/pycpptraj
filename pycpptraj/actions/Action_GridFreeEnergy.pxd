# distutils: language = c++
from Action cimport *
#from DataSet_GridFlt cimport *
#from GridAction cimport *


cdef extern from "Action_GridFreeEnergy.h": 
    cdef cppclass _Action_GridFreeEnergy "Action_GridFreeEnergy" (_Action):
        _Action_GridFreeEnergy() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_GridFreeEnergy (Action):
    cdef _Action_GridFreeEnergy* thisptr

