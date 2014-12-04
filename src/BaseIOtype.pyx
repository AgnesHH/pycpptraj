# distutils: language = c++


cdef class BaseIOtype:
    def __cinit__(self):
        self.thisptr = new _BaseIOtype()

    def __dealloc__(self):
        del self.thisptr

