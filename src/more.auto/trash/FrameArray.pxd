# distutils: language = c++
from Frame cimport *


cdef extern from "FrameArray.h": 
    cdef cpplass _FrameArray "FrameArray":
        _FrameArray() 
        void resize(int nIn)
        _Frame & operator [ ](int idx)
        void Add_Frame(const _Frame & fIn)
        int Setup_Frames(vector [_Atom] const & _Atoms, bint hasV, int Ndim)
        iterator begin() 
        iterator end() 
