# distutils: language = c++

cdef class CpptrajFile:

    def __cinit__(self, CpptrajFile cpp=None):
        if cpp is None:
            self.thisptr = new _CpptrajFile()
        elif isinstance(cpp, CpptrajFile):
            self.thisptr = new _CpptrajFile(cpp.thisptr[0])

    def __dealloc__(self):
        del self.thisptr

    def OpenRead(self, mstring):
        return self.thisptr.OpenRead(mstring)

    def SetupRead(self, mystring, myint):
        return self.thisptr.SetupRead(mystring, myint)

