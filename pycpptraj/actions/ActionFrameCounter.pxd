# distutils: language = c++
from ArgList cimport *


cdef extern from "ActionFrameCounter.h": 
    cdef cppclass _ActionFrameCounter "ActionFrameCounter" (_ActionFrameCounter):
        _Action_FrameCounter() 
        int Init_FrameCounter(_ArgList&)
        bint Check_FrameCounter(int frameNum) const 
        void _FrameCounterInfo() const 
        void _FrameCounterBrief() const 


cdef class ActionFrameCounter (ActionFrameCounter):
    cdef _ActionFrameCounter* thisptr

