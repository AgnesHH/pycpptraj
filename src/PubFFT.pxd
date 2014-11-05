# distutil: language = c++

cdef extern from "PubFFT.h":
    cdef cppclass _PubFFT "PubFFT":
        _PubFFT()
        _PubFFT(int)
        _PubFFT(const _PubFFT&)

        int size()
        void Forward(_ComplexArray&)
        void Back(_ComplexArray&)
        void SetupFFT_NextPowerOf2(int)
        int SetupFFTforN(int)

cdef class PubFFT:
    _PubFFT* thisptr
