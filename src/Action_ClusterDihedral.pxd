# distutils: language = c++
from Action cimport *


cdef extern from "Action_ClusterDihedral.h": 
    cdef cppclass _Action_ClusterDihedral "Action_ClusterDihedral":
        _Action_ClusterDihedral()
        pass
