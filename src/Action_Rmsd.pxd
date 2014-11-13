# distutils: language = c++
from Action cimport *
from Range cimport *
from ReferenceAction cimport *
from DataSet_1D cimport *


cdef extern from "Action_Rmsd.h": 
    cdef cppclass _Action_Rmsd "Action_Rmsd":
        _Action_Rmsd() 
        static _DispatchObject * Alloc() 
        static void Help() 
