# distutils: language = c++

from TrajoutList cimport *

cdef class TrajoutList:
    cdef _TrajoutList  *thisptr

    def __cinit__(self):
        self.thisptr = new _TrajoutList()

    def __dealloc__(self):
        del self.thisptr

    def SetDebug(self, int id):
        self.thisptr.SetDebug(id)

    def List(self):
        self.thisptr.List()
