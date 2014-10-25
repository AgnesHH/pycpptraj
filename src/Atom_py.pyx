# distutils: language = c++

from Atom cimport *

cdef class Atom_py:
    cdef Atom *thisptr

    def __cinit__(self):
        self.thisptr = new Atom()
    
    def do_cool_thing(self):
        #doing cool_thing here
        pass
