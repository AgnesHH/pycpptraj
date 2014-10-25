# distutils: language = c++

from Topology cimport *

cdef class Topology_py:
    cdef Topology  *thisptr

    def __cinit__(self):
        self.thisptr = new Topology()

    def __dealloc__(self):
        del self.thisptr


