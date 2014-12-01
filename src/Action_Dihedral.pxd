# distutils: language = c++
from Action cimport *


cdef extern from "Action_Dihedral.h": 
    cdef cppclass _Action_Dihedral "Action_Dihedral":
        _Action_Dihedral() 
        _DispatchObject * Alloc() 
        void Help() 
