# distutils: language = c++
from ArgList cimport *


cdef extern from "ActionFrameCounter.h": 
    cdef cppclass ActionFrameCounter "ActionFrameCounter":
        ActionFrameCounter() 
        int InitFrameCounter(ArgList&)
        bint CheckFrameCounter(int frameNum) const 
        void FrameCounterInfo() const 
        void FrameCounterBrief() const 
