# distutils: language = c++
from Action cimport *


cdef extern from "Action_Dihedral.h": 
    cdef cppclass Action_Dihedral "Action_Dihedral":
        Action_Dihedral() 
        DispatchObject * Alloc() 
        void Help() 
