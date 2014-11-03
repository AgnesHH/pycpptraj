# distutil: language = c++

cdef extern from "Action_ClusterDihedral.h":
    cdef cppclass Action_ClusterDihedral:
        Action_ClusterDihedral()
        DispatchObject* Alloc()
        void Help()
