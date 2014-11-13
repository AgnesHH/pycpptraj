# distutils: language = c++
from Action cimport *
from DihedralSearch cimport *


cdef extern from "Action_MultiDihedral.h": 
    cdef cppclass _Action_MultiDihedral "Action_MultiDihedral":
        _Action_MultiDihedral() 
        _DispatchObject * Alloc() 
        void Help() 
