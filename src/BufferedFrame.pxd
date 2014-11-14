# distutils: language = c++
from CpptrajFile cimport *


cdef extern from "BufferedFrame.h": 
    cdef cppclass _BufferedFrame "BufferedFrame":
        Buffered_Frame() 
        #~Buffered_Frame() 
        size_t Setup_FrameBuffer(int, int, int)
        size_t Setup_FrameBuffer(int, int, int, size_t, int)
        size_t ResizeBuffer(int)
        int SeekTo_Frame(size_t)
        int AttemptRead_Frame() 
        bint Read_Frame() 
        int Write_Frame() 
        void GetDoubleAtPosition(double&, size_t, size_t)
        void BufferBegin() 
        void BufferBeginAt(size_t)
        void AdvanceBuffer(size_t)
        void BufferToDouble(double *, int)
        void DoubleToBuffer(const double *, int, const char *)
        size_t _FrameSize() const 
        const char * Buffer() const 
