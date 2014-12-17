# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Topology cimport Topology


cdef class FrameArray:
    def __cinit__(self):
        self.thisptr = new _FrameArray()

    def __dealloc__(self):
        del self.thisptr

    def resize(self,int nIn):
        self.thisptr.resize(nIn)

    def __getitem__(FrameArray self, int idx):
        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.index_opr(idx)
        return frame

    def __setitem__(FrameArray self, int idx, Frame value):
        raise NotImplementedError()
        # does not work since there is no assigment in cpptraj
        #cdef int i = 0
        #cdef iterator it = self.thisptr.begin()
        #while it != self.thisptr.end():
        #    if i == idx:
        #        deref(it) = value.thisptr[0]
        #        break
        #    i += 1
        #    incr(it)
        
    def __len__(FrameArray self):
        cdef int i = 0
        cdef Frame frame
        for frame in self:
            i += 1
        return i

    def __iter__(self):
        cdef iterator it = self.thisptr.begin()
        cdef Frame frame 
        while it != self.thisptr.end():
            frame = Frame()
            frame.thisptr[0] = deref(it)
            yield frame
            incr(it)

    def append(self, Frame fIn):
        self.thisptr.AddFrame(fIn.thisptr[0])

    def set_frames(self, Topology top,  bint hasV, int Ndim):
        self.thisptr.SetupFrames(top.thisptr.Atoms(), hasV, Ndim)
