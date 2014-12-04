# distutils: language = c++
from AtomMap cimport *

cdef class AtomMap_py:
    cdef _AtomMap * thisptr

    def __cinit__(self):
        self.thisptr = new _AtomMap()
    
    def __dealloc__(self):
        del self.thisptr

    cpdef int Natom(self):
        return self.thisptr.Natom()

    def SetDebug(self, int flag):
        self.thisptr.SetDebug(flag)
    
    cdef int Setup(self, Topology top):
        return self.thisptr.Setup(top.thisptr[0])
