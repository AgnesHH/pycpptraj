from Analysis_Clustering_pxd cimport *

cdef class Analysis_Clustering:
    cdef _Analysis_Clustering * thisptr

    def __cinit__(self):
        self.thisptr = new _Analysis_Clustering()

    def __dealloc__(self):
        del self.thisptr

    def Help(self):
        self.thisptr.Help()

