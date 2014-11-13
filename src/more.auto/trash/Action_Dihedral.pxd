# distutils: language = c++
from Action cimport *


cdef extern from "Action_Dihedral.h": 
    cdef cpplass _Action_Dihedral "Action_Dihedral":
        _Action_Dihedral() 
        static _DispatchObject * Alloc() 
        static void Help() 
