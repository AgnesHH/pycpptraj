from libcpp.string cimport string as cstring
from Analysis_Clustering cimport *

cdef class Analysis_Clustering:
    cdef:
        _Analysis_Clustering * thisptr
        cstring maskexpr_
        int sieve_
        bint nofitrms_
        bint useMass_

    def __cinit__(self):
        self.thisptr = new _Analysis_Clustering()

    def __dealloc__(self):
        del self.thisptr

    def Help(self):
        self.thisptr.Help()

