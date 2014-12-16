# distutils: language = c++
from Action cimport *
from ..Range cimport *
from ..ReferenceAction cimport *
from ..DataSet_1D cimport *


cdef extern from "Action_Rmsd.h": 
    cdef cppclass _Action_Rmsd"Action_Rmsd" (_Action):
        _Action_Rmsd() 
        _DispatchObject * Alloc() 
        void Help() 

cdef class Action_Rmsd(Action):
    cdef _Action_Rmsd* ptr
