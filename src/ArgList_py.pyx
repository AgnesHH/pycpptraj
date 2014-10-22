# distutils: language = c++

from ArgList_pxd cimport *

cdef class ArgList:
    cdef _ArgList *thisptr

    def __cinit__(self):
        self.thisptr = new _ArgList()

    def __dealloc__(self):
        del self.thisptr

    def AddArg(self, mystring):
        self.thisptr.AddArg(mystring)

    def hasKey(self, key):
        return self.thisptr.hasKey(key)

    def CheckForMoreArgs(self):
        return self.thisptr.CheckForMoreArgs()

    def PrintList(self):
        self.thisptr.PrintList()

    def ClearList(self):
        self.thisptr.ClearList()


