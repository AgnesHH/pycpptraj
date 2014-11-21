# distutils: language = c++
from libcpp.vector cimport vector
from Matrix cimport *


cdef extern from "Hungarian.h": 
    cdef cppclass Hungarian "Hungarian":
        Hungarian() : nrows_(0 ), ncols_(0)
        int Initialize(size_t)
        void AddElement(double d)
        vector[int] Optimize() 
