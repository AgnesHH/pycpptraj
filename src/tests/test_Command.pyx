# distutils: language = c++

from Command cimport *
from CpptrajState cimport _CpptrajState

cdef:
    _Command * p = new _Command()
    _CpptrajState cppstate

fname = "cpptraj.in"
#p.ProcessInput(cppstate, fname)
p.ListCommands(GENERAL)
#print cppstate.WorldSize()

del p
