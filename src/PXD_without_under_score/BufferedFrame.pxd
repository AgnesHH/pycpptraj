# distutils: language = c++
from CpptrajFile cimport *


cdef extern from "BufferedFrame.h": 
    cdef cppclass BufferedFrame "BufferedFrame":
        BufferedFrame() 
        #~BufferedFrame() 
        size_t SetupFrameBuffer(int, int, int)
        size_t SetupFrameBuffer(int, int, int, size_t, int)
        size_t ResizeBuffer(int)
        int SeekToFrame(size_t)
        int AttemptReadFrame() 
        bint ReadFrame() 
        int WriteFrame() 
        void GetDoubleAtPosition(double&, size_t, size_t)
        void BufferBegin() 
        void BufferBeginAt(size_t)
        void AdvanceBuffer(size_t)
        void BufferToDouble(double *, int)
        void DoubleToBuffer(const double *, int, const char *)
        size_t FrameSize() const 
        const char * Buffer() const 
