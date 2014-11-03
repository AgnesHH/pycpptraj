# distutils: language = c++
from Matrix cimport *

cdef class Matrix_py:
    cdef Matrix[double]* thisptr

    def __cinit__(self):
        self.thisptr = new Matrix[double]()

    def __dealloc__(self):
        del self.thisptr

    property size:
        def __get__(self):
            return self.thisptr.size()

    def resize(self, size_t size1, size_t size2):
        self.thisptr.resize(size1, size2)

    def Nrows(self):
        return self.thisptr.Nrows()

    def Ncols(self):
        return self.thisptr.Ncols()

    def addElement(self, const double &mymat):
        self.thisptr.addElement(mymat)

    def setElement(self, a, b, const double &mymat):
        self.thisptr.setElement(a, b, mymat)

    #cdef double* Ptr(self):
    #    return self.thisptr.Ptr()

    def CalcIndex(self, idx1, idx2):
        return self.thisptr.CalcIndex(idx1, idx2)

    cdef ArrayIterator[double] begin(self):
        return self.thisptr.begin()

    cdef ArrayIterator[double] end(self):
        return self.thisptr.end()
