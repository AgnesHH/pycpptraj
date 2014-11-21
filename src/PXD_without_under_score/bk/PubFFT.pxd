# distutils: language = c++
from ComplexArray cimport *


cdef extern from "PubFFT.h": 
    cdef cppclass PubFFT "PubFFT":
        PubFFT() 
        #~PubFFT() 
        PubFFT(int)
        PubFFT(const PubFFT&)
        #PubFFT& operator =(const PubFFT&)
        int size() const 
        void Forward(ComplexArray&)
        void Back(ComplexArray&)
        int SetupFFT_NextPowerOf2(int)
        int SetupFFTforN(int)
