# distutils: language = c++

from Cpptraj cimport _Cpptraj
cimport Cpptraj

cdef _Cpptraj* p = new _Cpptraj()
cdef Cpptraj.Mode testmode = Cpptraj.ERROR

print testmode
del p
