# distutils: language = c++
from Frame cimport *


cdef extern from "FrameArray.h": 
    cdef cppclass _FrameArray "FrameArray":
        _FrameArray() 
        void resize(int nIn)
        _Frame& operator[](int idx)
        void Add_Frame(const _Frame& fIn)
        int Setup_Frames(const vector[_Atom]& _Atoms, bint hasV, int Ndim)
        #iterator begin() 
        #iterator end() 
