# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Topology cimport Topology


cdef class FrameArray:
    """FrameArray: Holding array of Frame pointers"""
    def __cinit__(self):
        pass

    def resize(self, int sizet):
        self.frame_v.resize(sizet)

    def __getitem__(FrameArray self, int idx):
        """Return a Frame 'view'
        """
        cdef Frame frame = Frame()
        frame.py_free_mem = False

        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        frame.thisptr = self.frame_v[idx]
        return frame

    def __setitem__(FrameArray self, int idx, Frame other):
        cdef _Frame* ptr
        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        ptr = self.frame_v[idx]
        ptr[0] = other.thisptr[0]
        
    def __delitem__(FrameArray self, int idx):
        self.erase(idx)

    def erase(self, int idx):
        # TODO: need to re-indexing
        cdef _Frame* ptr
        ptr = self.frame_v[idx]
        self.frame_v.erase(self.frame_v.begin() + idx)
        del ptr
        
    @property
    def size(self):
        return self.frame_v.size()

    def __len__(self):
        return self.size

    def __iter__(self):
        """return an copy of Frame instance"""
        cdef vector[_Frame*].iterator it  = self.frame_v.begin()
        cdef Frame frame 

        while it != self.frame_v.end():
            frame = Frame()
            frame.thisptr[0] = deref(deref(it))
            yield frame
            incr(it)

    def append(self, Frame framein):
        self.frame_v.push_back(framein.thisptr)
