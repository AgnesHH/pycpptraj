# distutils: language = c++

from CpptrajStdio cimport *
from Analysis_Integrate_py cimport *

cdef class Analysis_Integrate:
    cdef _Analysis_Integrate  *thisptr

    def __cinit__(self):
        self.thisptr = new _Analysis_Integrate()

    def __dealloc__(self):
        del self.thisptr

    def Help(self):
        self.Help(self)
