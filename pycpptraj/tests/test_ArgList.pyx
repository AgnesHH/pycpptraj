# distutils: language = c++

from ArgList cimport *

cdef _ArgList* p = new _ArgList()

del p
