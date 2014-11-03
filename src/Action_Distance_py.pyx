# distutils: language = c++

from Action_Distance cimport *

cdef class Action_Distance_py:
    cdef Action_Distance* thisptr
    cdef char* NOE_Help

    def __cinit__(self):
        self.thisptr = new Action_Distance()

    def __dealloc__(self):
        del self.thisptr

    property NOE_Help:
        def __get__(self):
            return self._NOE_Help()

    def _NOE_Help(self):
        return self.thisptr.NOE_Help

