# distutils: language = c++

cdef class ActionList:

    def __cinit__(self):
        self.thisptr = new _ActionList()

    def __dealloc__(self):
        del self.thisptr

