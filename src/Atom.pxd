# distutils: language = c++

cdef extern from "Atom.h":
    cdef cppclass Atom:
        Atom()
