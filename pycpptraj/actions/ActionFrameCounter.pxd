# distutil: language = c++

cdef extern from "ActionFrameCounter.h":
    cdef cppclass _ActionFrameCounter "ActionFrameCounter":
        pass
