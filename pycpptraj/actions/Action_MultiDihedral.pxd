# distutils: language = c++
#from libcpp.vector cimport vector
#from libcpp.string cimport string
from Action cimport *
#from DihedralSearch cimport *


cdef extern from "Action_MultiDihedral.h": 
    cdef cppclass _Action_MultiDihedral "Action_MultiDihedral" (_Action):
        _Action_MultiDihedral() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_MultiDihedral (Action):
    cdef _Action_MultiDihedral* thisptr

