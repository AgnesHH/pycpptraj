# distutils: language = c++
from Action cimport *
from DataSet_GridFlt cimport *
from GridAction cimport *


cdef extern from "Action_Dipole.h": 
    cdef cpplass _Action_Dipole "Action_Dipole":
        _Action_Dipole() 
        static _DispatchObject * Alloc() 
        static void Help() 
