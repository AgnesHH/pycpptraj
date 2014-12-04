# distutils: language = c++


cdef class BufferedFrame:
    def __cinit__(self):
        self.thisptr = new _BufferedFrame()

    def __dealloc__(self):
        del self.thisptr

    def SetupFrameBuffer(self, size_t additionalBytes=0, int offsetIn=0, *args):
        cdef int Nelts, eltWidthIn, eltsPerLine

        if len(args) == 3:
            Nelts, eltWidthIn, eltsPerLine = args
            self.thisptr.SetupFrameBuffer(Nelts, eltWidthIn, eltsPerLine, additionalBytes, offsetIn)
        else:
            raise ValueError()

    #def size_t SetupFrameBuffer(self,int, int, int):

    #def size_t SetupFrameBuffer(self,int, int, int, size_t, int):

    def ResizeBuffer(self, int delta):
        return self.thisptr.ResizeBuffer(delta)

    def SeekToFrame(self,size_t idx):
        return self.thisptr.SeekToFrame(idx)

    def AttemptReadFrame(self):
        return self.thisptr.AttemptReadFrame()

    def ReadFrame(self):
        return self.thisptr.ReadFrame()

    def WriteFrame(self):
        return self.thisptr.WriteFrame()

    def GetDoubleAtPosition(self, double val, size_t start, size_t end):
        self.thisptr.GetDoubleAtPosition(val, start, end)

    def BufferBegin(self):
        self.thisptr.BufferBegin()

    def BufferBeginAt(self,size_t idx):
        self.thisptr.BufferBeginAt(idx)

    def AdvanceBuffer(self,size_t idx):
        self.thisptr.AdvanceBuffer(idx)

    def BufferToDouble(self, double[:] Xout, int Nout):
        self.thisptr.BufferToDouble(&Xout[0], Nout)

    def DoubleToBuffer(self, double[:] Xin, int Nin, char * _format):
        self.thisptr.DoubleToBuffer(&Xin[0], Nin, _format)

    def FrameSize(self):
        return self.thisptr.FrameSize()

    def Buffer(self):
        return self.thisptr.Buffer()

