# distutils: language = c++

from CpptrajState cimport *

cdef _CpptrajState* p = new _CpptrajState()

del p
