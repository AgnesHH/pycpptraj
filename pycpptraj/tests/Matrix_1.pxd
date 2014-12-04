# distutil: language = c++
from ArrayIterator cimport *

cdef extern from "Matrix.h":
    cdef cppclass _Matrix[T] "Matrix[T]":
        _Matrix()
        #Matrix()
        #Matrix(const Matrix&)
        #T& operator[](size_t idx)
        #const T& operator[] (size_t)
        size_t size()
        #int resize(size_t, size_t)
        #const T& element(int, int) const
        #T& element(int, int)
        #size_t Nrows()
        #size_t Ncols()
        #int addElement(const T&)
        #void setElement(int, int, const T&)
        #const T* Ptr()
        #T* Ptr()
        #size_t CalcIndex(int, int)
        ##Cython has not yet support nested ctypedef
        ##ctypedef ArrayIterator[T] iterator
        #ArrayIterator[T] begin()
        #ArrayIterator[T] end()
