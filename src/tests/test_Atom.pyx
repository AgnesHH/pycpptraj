# distutils: language = c++

from Atom cimport *

cdef _Atom* p = new _Atom()

del p
