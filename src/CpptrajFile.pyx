# distutils: language = c++

cdef class CpptrajFile:

    def __cinit__(self):
        self.thisptr = new _CpptrajFile()

    def __dealloc__(self):
        del self.thisptr
