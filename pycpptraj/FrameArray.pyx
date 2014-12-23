# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Topology cimport Topology


cdef class FrameArray:
    """FrameArray: Holding array of Frame pointers"""
    def __cinit__(self):
        pass

    def copy(self):
        "Return a copy of FrameArray"
        cdef FrameArray other = FrameArray()
        cdef _Frame _frame
        for _frame in self.frame_v:
            other.frame_v.push_back(_frame)
        return other

    def __getitem__(FrameArray self, int idx):
        """Return a copy of FrameArray[idx]
        """
        cdef Frame frame = Frame()
        # debug
        #print "I am getting an item"

        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        frame.thisptr[0] = self.frame_v[idx]
        return frame

    def __setitem__(FrameArray self, int idx, Frame other):
        cdef _Frame* ptr
        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        self.frame_v[idx] = other.thisptr[0]
        
    def __delitem__(FrameArray self, int idx):
        self.erase(idx)

    def erase(self, int idx):
        self.frame_v.erase(self.frame_v.begin() + idx)
        
    @property
    def size(self):
        return self.frame_v.size()

    def __len__(self):
        return self.size

    def __iter__(self):
        """return an copy of Frame instance"""
        cdef vector[_Frame].iterator it  = self.frame_v.begin()
        cdef Frame frame 

        while it != self.frame_v.end():
            frame = Frame()
            frame.thisptr[0] = deref(it)
            yield frame
            incr(it)

    def append(self, Frame framein):
        cdef Frame frame = Frame(framein)
        self.frame_v.push_back(frame.thisptr[0])
