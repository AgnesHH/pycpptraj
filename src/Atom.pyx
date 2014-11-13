# distutils: language = c++

from Atom cimport *

cdef class Atom_py:
    def __cinit__(self):
        self.thisptr = new Atom()
