# distutils: language = c++


cdef class Command:
    def __cinit__(self):
        self.thisptr = new _Command()

    def __dealloc__(self):
        del self.thisptr
