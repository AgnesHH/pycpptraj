from CpptrajFile cimport *

cdef _CpptrajFile* cpp = new _CpptrajFile()
print cpp.Access()

del cpp
