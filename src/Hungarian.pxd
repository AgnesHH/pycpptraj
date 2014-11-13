# distutils: language = c++
from Matrix cimport *


cdef extern from "Hungarian.h": 
    cdef cppclass _Hungarian "Hungarian":
        _Hungarian() : nrows_(0 ), ncols_(0)
        int Initialize(size_t)
        void AddElement(double d)
        vector [int] Optimize() 
