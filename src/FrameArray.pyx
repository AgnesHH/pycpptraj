# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr


cdef class FrameArray:
    def __cinit__(self):
        self.thisptr = new _FrameArray()

    def __dealloc__(self):
        del self.thisptr

    def resize(self,int nIn):
        self.thisptr.resize(nIn)

    def __getitem__(FrameArray self, int idx):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.index_opr(idx)
        return frame

    def __iter__(self):
        cdef iterator it = self.thisptr.begin()
        cdef Frame frame 
        while it != self.thisptr.end():
            frame = Frame()
            frame.thisptr[0] = deref(it)
            yield frame
            incr(it)

    def AddFrame(self, Frame fIn):
        self.thisptr.AddFrame(fIn.thisptr[0])

    #def SetupFrames(self, vector[Atom] Atoms, bint hasV, int Ndim):
    #    self.thisptr.SetupFrames(Atoms, hasV, Ndim)


