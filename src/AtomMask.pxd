# distutil: language = c++

from libcpp.vector cimport vector
from libcpp.string cimport string
from MaskToken cimport *

cdef extern from "AtomMask.h":
    cdef cppclass _AtomMask "AtomMask":
        _AtomMask()
        _AtomMask(const string&)
        _AtomMask(int, int)
        _AtomMask(int)
        _AtomMask(const _AtomMask&)
        #add more
