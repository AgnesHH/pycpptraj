# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Topology cimport Topology


cdef class FrameArray:
    def __cinit__(self, top=Topology()):
        self.top = top

    def copy(self):
        "Return a copy of FrameArray"
        cdef FrameArray other = FrameArray()
        cdef _Frame _frame
        for _frame in self.frame_v:
            other.frame_v.push_back(_frame)
        return other

    def __getitem__(FrameArray self, int idx):
        """Return a reference of FrameArray[idx]
        """
        cdef Frame frame = Frame()

        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        frame.thisptr[0] = self.frame_v[idx]
        return frame

    def __setitem__(FrameArray self, int idx, Frame other):
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

    def get_frames(self, Trajin_Single ts, update_top=False):
        """get frames from Trajin instance
        Parameters:
        ----------
        traj : Trajin instance

        Note:
        ----
        Have not support indices yet. Get max_frames from trajetory
        """
        cdef int i
        if self.top.n_atoms != ts.top.n_atoms:
            raise ValueError("FrameArray.top.n_atoms should be equal to Trajin_Single.top.n_atoms or set update_top=True")

        frame = Frame()
        frame.set_frame_v(ts.top, ts.has_vel(), ts.n_repdims)
        ts.begin_traj()
        for i in range(ts.max_frames):
            ts.get_next_frame(frame)
            self.append(frame)
        ts.end_traj()
        if update_top:
            self.top = ts.top.copy()
