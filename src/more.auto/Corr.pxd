# distutils: language = c++
from PubFFT cimport *


cdef extern from "Corr.h": 
    cdef cpplass _CorrF_Direct "CorrF_Direct":
        _CorrF_Direct() : nsteps_(0)
        _CorrF_Direct(int stepsIn): nsteps_(stepsIn ), table_(2 * nsteps_, 0.0)
        void Allocate(int)
        void AutoCorr(_ComplexArray &)
        void CrossCorr(_ComplexArray &, const _ComplexArray&)
