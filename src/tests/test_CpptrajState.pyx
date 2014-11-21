# distutils: language = c++

from CpptrajState cimport *

cdef _CpptrajState* p = new _CpptrajState()

p.RunAnalyses()
p.Run()
del p
