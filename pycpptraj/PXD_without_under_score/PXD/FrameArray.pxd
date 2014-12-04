# distutils: language = c++
from libcpp.vector cimport vector
from Frame cimport *


cdef extern from "FrameArray.h": 
    cdef cppclass FrameArray "FrameArray":
        FrameArray() 
        void resize(int nIn)
        Frame& operator[](int idx)
        void AddFrame(const Frame& fIn)
        int SetupFrames(const vector[Atom]& Atoms, bint hasV, int Ndim)
        #iterator begin() 
        #iterator end() 
