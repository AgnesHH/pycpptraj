# distutils: language = c++

cdef class CpptrajFile:

    def __cinit__(self, cpp=None):
        if cpp is None:
            self.thisptr = new _CpptrajFile()
        else if isinstance(cpp, CpptrajFile):
            self.thisptr = new _CpptrajFile(cpp.thisptr)

    def __dealloc__(self):
        del self.thisptr

    def OpenRead(self, mstring):
        return self.thisptr.OpenRead(mstring)

    def SetupRead(self, mystring, myint):
        return self.thisptr.SetupRead(mystring, myint)

if __name__ == '__main__':
    cpp1 = CpptrajFile()
    cpp2 = CpptrajFile(cpp1)

