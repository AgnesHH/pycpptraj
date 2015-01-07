# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Topology cimport Topology

# python level
from pycpptraj.Trajectory import Trajectory

cdef class FrameArray:
    def __cinit__(self, top=Topology()):
        self.top = top

    def copy(self):
        "Return a copy of FrameArray"
        cdef FrameArray other = FrameArray()
        cdef _Frame _frame
        for _frame in self.frame_v:
            other.frame_v.push_back(_frame)
        # copy self.top too
        other.top = self.top.copy()
        return other

    def __dealloc__(FrameArray self):
        """should we free memory for Frame instances here?
        (we set frame.py_free_mem = False in __getitem__)
        """
        for frame in self:
            # we don't __dealloc__ here.
            # just turn py_free_mem on to let Frame class frees memory
            # work?
            # NO : Error in `python': double free or corruption (out)`
            # --> don't need this method. We still have the commented code here to 
            # remind not need to add in future.
            #frame.py_free_mem = True
            pass

    def __getitem__(FrameArray self, int idx):
        """Return a reference of FrameArray[idx]
        To get a copy
        >>>frame = FrameArray_instance[10].copy()
        TODO : add negative indexing
        """
        cdef Frame frame = Frame()
        frame.py_free_mem = False

        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        frame.thisptr = &(self.frame_v[idx])
        return frame

    def __setitem__(FrameArray self, int idx, Frame other):
        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        self.frame_v[idx] = other.thisptr[0]
        
    def __delitem__(FrameArray self, int idx):
        self.erase(idx)

    def __str__(FrameArray self):
        name = self.__class__.__name__
        tmps = "%s instance with %s frames, %s atoms/frame" % (name, self.size, self.top.n_atoms)
        return tmps

    def erase(self, int idx):
        self.frame_v.erase(self.frame_v.begin() + idx)
        
    @property
    def size(self):
        return self.frame_v.size()

    def __len__(self):
        return self.size

    def __iter__(self):
        """return a reference of Frame instance"""
        cdef vector[_Frame].iterator it  = self.frame_v.begin()
        cdef Frame frame 

        while it != self.frame_v.end():
            frame = Frame()
            # use memoryview, don't let python free memory of this instance
            frame.py_free_mem = False
            frame.thisptr = &(deref(it))
            yield frame
            incr(it)

    def append(self, Frame framein, copy=True):
        cdef Frame frame = Frame() 
        if copy:
            frame = framein.copy()
        else:
            # create memory view
            # need to set `py_free_mem` to False
            frame.py_free_mem = False
            frame.thisptr = framein.thisptr
        self.frame_v.push_back(frame.thisptr[0])

    def get_frames(self, ts, indices=None, update_top=False):
        # TODO : fater loading?
        """get frames from Trajin instance
        Parameters:
        ----------
        traj : Trajin or Trajing_Single or Trajectory instance

        Note:
        ----
        Have not support indices yet. Get max_frames from trajetory
        """
        cdef int i
        cdef Frame frame

        if update_top:
            self.top = ts.top.copy()

        if self.top.n_atoms != ts.top.n_atoms:
            raise ValueError("FrameArray.top.n_atoms should be equal to Trajin_Single.top.n_atoms or set update_top=True")

        if isinstance(ts, Trajin_Single) or isinstance(ts, Trajectory):
            if indices:
                # slow method
                # TODO : use `for idx in leng(indices)`?
                for i in indices:
                    self.append(ts[i])
            else:    
                # get whole traj
                frame = Frame()
                frame.set_frame_v(ts.top, ts.has_vel(), ts.n_repdims)
                ts.begin_traj()
                for i in range(ts.max_frames):
                    ts.get_next_frame(frame)
                    self.append(frame)
                ts.end_traj()

        elif isinstance(ts, FrameArray2):
            # TODO : rename FrameArray2
            # use try and except?
            if not indices:
                for i in range(ts.size):
                    # TODO : make indices as an array?
                    self.append(ts[i])
            else:
                for i in indices:
                    # TODO : make indices as an array?
                    self.append(ts[i])

    def strip_atoms(self, mask=None, update_top=True, bint has_box=False):
        cdef vector[_Frame].iterator it
        cdef Frame frame = Frame()
        cdef Topology tmptop

        frame.py_free_mem = False
        it = self.frame_v.begin()
        while it != self.frame_v.end():
            # do not dealloc since we use memoryview for _Frame
            frame.thisptr = &(deref(it))
            # we need to update topology since _strip_atoms will modify it
            tmptop = self.top.copy()
            frame._strip_atoms(tmptop, mask, update_top, has_box)
            # debug
            #print "tmptop.n_atoms:", tmptop.n_atoms
            # debug
            incr(it)
        if update_top:
            self.top = tmptop.copy()
