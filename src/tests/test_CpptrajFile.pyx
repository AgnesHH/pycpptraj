from CpptrajFile cimport *

cdef _CpptrajFile* p = new _CpptrajFile()

print p.Access()
del p
