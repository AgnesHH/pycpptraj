# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DihedralSearch cimport *


cdef extern from "Action_MultiDihedral.h": 
    cdef cppclass Action_MultiDihedral "Action_MultiDihedral":
        Action_MultiDihedral() 
        DispatchObject * Alloc() 
        void Help() 
