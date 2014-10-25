# distutils: language = c++

from FileName cimport *

cdef class FileName_py:
    cdef FileName * thisptr

    def __cinit__(self, myname=''):
        self.thisptr = new FileName()
        self.thisptr.SetFileName(myname)

    def __dealloc__(self):
        del self.thisptr

    def SetFileName(self, mystring):
        self.thisptr.SetFileName(mystring)

    def SetFileNameWithExpansion(self, mystring):
        self.thisptr.SetFileNameWithExpansion(mystring)
    
    def clear(self):
        self.thisptr.clear()

    def MatchFullOrBase(self, mystring):
        return self.thisptr.MatchFullOrBase(mystring)

    def Full(self):
        return self.thisptr.Full()

    def Base(self):
        return self.thisptr.Base()

    property ext:
        def __get__(self):
            return self.Ext()

    def Ext(self):
        return self.thisptr.Ext()

    def empty(self):
        return self.thisptr.empty()

    def Compress(self):
        return self.thisptr.Compress()

    def DirPrefix(self):
        return self.thisptr.DirPrefix()
    
    def full(self):
        self.thisptr.full()
