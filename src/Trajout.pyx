# distutils: language = c++

cdef class Trajout:

    def __cinit__(self):
        self.thisptr = new _Trajout()

    def __dealloc__(self):
        del self.thisptr

