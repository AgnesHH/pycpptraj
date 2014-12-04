# distutils: language = c++
from libcpp.vector cimport vector
from Frame cimport *

ctypedef vector[_Frame].iterator iterator

cdef extern from "FrameArray.h": 
    cdef cppclass _FrameArray "FrameArray":
        _FrameArray() 
        void resize(int nIn)
        _Frame& index_opr "operator[]"(int idx)
        void AddFrame(const _Frame& fIn)
        int SetupFrames(const vector[_Atom]& _Atoms, bint hasV, int Ndim)
        iterator begin() 
        iterator end() 


cdef class FrameArray:
    cdef _FrameArray* thisptr
