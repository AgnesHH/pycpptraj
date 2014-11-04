# distutil: language = c++

from libcpp.string cimport *

cdef class MapAtom:
    def __cinit__(self):
        self.thisptr = new _MapAtom()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def IsChiral(self):
        return self.thisptr.IsChiral()

    def IsMapped(self):
        return self.thisptr.IsMapped()

    #add more here

    def SetAtomID(self, string myid):
        self.thisptr.SetAtomID(myid)

    #add more here
