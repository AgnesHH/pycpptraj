# distutils: language = c++

from Topology_pxd cimport *

cdef class Topology:
    cdef _Topology  *thisptr

    def __cinit__(self):
        self.thisptr = new _Topology()

    def __dealloc__(self):
        del self.thisptr


