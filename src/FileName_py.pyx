# distutils: language = c++

from libcpp.string cimport string

cdef extern from "FileName.h":
    cdef cppclass _FileName "FileName":
    #cdef cppclass FileName:
        FileName()
        FileName(FileName)
        int SetFileName(string)
        int SetFileNameWithExpansion(string)
        int SetFileName(string, bool)

        void clear()
        bint MatchFullOrBase(string)

        string Full()
        string Base()
        char * full()
        char * base()
        string Ext()
        string Compress()
        string DirPrefix()
        bint empty()

cdef class FileName:
    cdef _FileName * thisptr

    def __cinit__(self, myname=''):
        self.thisptr = new _FileName()
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
