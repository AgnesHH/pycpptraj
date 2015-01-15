#print print  distutils: language = c++
cimport cython
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from pycpptraj.Topology cimport Topology
from pycpptraj._utils cimport get_positive_idx

# python level
from pycpptraj.Trajectory import Trajectory

cdef class FrameArray:
    def __cinit__(self, string fname='', top=None, indices=None, bint warning=False):

        if isinstance(top, basestring):
            self.top = Topology(top)
        elif isinstance(top, Topology):
            self.top = top.copy()
        else:
            # create empty topology
            self.top = Topology()

        self.warning = warning

        # since we are using memoryview for slicing this class istance, we just need to 
        # let `parent` free memory
        # this variable is intended to let FrameArray control 
        # freeing memory for Frame instance but it's too complicated
        #self.is_mem_parent = True
        if not fname.empty():
            # TODO : check if file exist
            self.load(fname=fname, indices=indices)

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
        #print "Test FrameArray exiting"
        pass
        #cdef Frame frame
        #if self.is_mem_parent:
        #    for frame in self:
        #        # we don't __dealloc__ here.
        #        # just turn py_free_mem on to let Frame class frees memory
        #        # work?
        #        # NO : Error in `python': double free or corruption (out)`
        #        # --> don't need this method. We still have the commented code here to 
        #        # remind not need to add in future.
        #        #frame.py_free_mem = True
        #        del frame.thisptr

    def __del__(self):
        cdef Frame frame
        for frame in self:
            del frame.thisptr

    def load(self, fname='', Topology top=None, indices=None):
        # TODO : add more test cases
        cdef Trajin_Single ts
        cdef int idx

        if isinstance(fname, basestring):
            ts = Trajin_Single()
            if top is not None:
                ts.top = top.copy()
                ts.load(fname)
                # update top for self too
                if not self.top.is_empty():
                    print "updating FrameArray topology"
                self.top = top.copy()
            else:
                # use self.top
                ts.top = self.top.copy()
                ts.load(fname)

            if indices is None:
                # load all frames
                self.join(ts[:])

            elif isinstance(indices, slice):
                self.join(ts[indices])
            else:
                raise NotImplementedError("loading random list of numbers is to slow")
                # indices is tuple, list, array, ...
                # we loop all traj frames and extract frame-id in indices 
                # TODO : check negative indexing?
                # increase size of vector
                #old_size = self.size
                #indices_len = len(indices)

                # make more room for vector
                #self.frame_v.resize(old_size + indices_len, _Frame())
                #print self.size
                #print self[0]
                #print self[1]
                #print self[2]

                #for idx in range(ts.size):
                #    if idx in indices:
                #        idx_idx = indices.index(idx)
                #        self[old_size + idx_idx - 1] = ts[idx].copy()

        elif isinstance(fname, (list, tuple)):
            for fh in fname:
                self.load(fh, top, indices)
        else:
            raise ValueError("can not load file/files")

    @cython.boundscheck(False)
    @cython.wraparound(False)
    def __getitem__(self, idxs):
        # TODO : same as Trajin class
        # should combine or inherit or ?
        #"""Return a reference of FrameArray[idx]
        #To get a copy
        #>>>frame = FrameArray_instance[10].copy()

        # TODO : why not using existing slice of list?

        cdef Frame frame = Frame(self.top.n_atoms)
        cdef FrameArray farray
        cdef int start, stop, step
        cdef int i
        cdef int idx_1, idx_2

        frame.py_free_mem = False

        if self.warning:
            print "return a Frame or sub-Framearray view of this instance"
            print "Use with care. For safetype, use `copy` method"

        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        if not isinstance(idxs, slice):
            idx_1 = get_positive_idx(idxs, self.size)
            # raise index out of range
            if idxs != 0 and idx_1 == 0:
                # need to check if array has only 1 element. 
                # arr[0] is  arr[-1]
                if idxs != -1:
                    raise ValueError("index is out of range")
            # get memoryview
            #frame.thisptr = &(self.frame_v[idx_1])
            # change [] to `at` for bound-checking
            frame.thisptr = &(self.frame_v.at(idx_1))
            return frame
        else:
            # creat a subset array of `FrameArray`
            farray = FrameArray()
            # farray.is_mem_parent = False

            # should we make a copy of self.top or get memview?
            farray.top = self.top.copy()
            # create positive indexing for start, stop if they are None
            start, stop, step  = idxs.indices(self.size)
            
            # mimic negative step in python list
            # debug
            #print "before updating (start, stop, step) = (%s, %s, %s)" % (start, stop, step)
            if start > stop and (step < 0):
                # since reading TRAJ is not random access for large file, we read from
                # begining to the end and append Frame to FrameArray
                # we will reverse later after getting all needed frames
                # traj[:-1:-3]
                is_reversed = True
                # swap start and stop but adding +1 (Python does not take last index)
                # a = range(10) # a[5:1:-1] = [5, 4, 3, 2]
                # a[2:5:1] = [2, 3, 4, 5]
                start, stop = stop + 1, start + 1
                step *= -1
            else:
                is_reversed = False

            # debug
            #print "after updating (start, stop, step) = (%s, %s, %s)" % (start, stop, step)
      
            for i in range(start, stop, step):
                # turn `copy` to `False` to have memoryview
                # turn `copy` to `True` to make a copy
                farray.append(self[i], copy=True)
            if is_reversed:
                # reverse vector if using negative index slice
                # traj[:-1:-3]
                farray.reverse()
            return farray

    def __setitem__(self, int idx, Frame other):
        # TODO : add slice
        # make a copy
        # to make thing simple, we don't use fancy slicing here
        if len(self) == 0:
            raise ValueError("Your FrameArray is empty, how can I index it?")
        self.frame_v[idx] = other.thisptr[0]
        # TODO : check this
        #self[idx].py_free_mem = False
        
    def __delitem__(FrameArray self, int idx):
        self.erase(idx)

    def __str__(FrameArray self):
        name = self.__class__.__name__
        n_atoms = 0 if self.top.is_empty() else self.top.n_atoms
        tmps = """%s instance with %s frames, %s atoms/frame
                  ID = %s
               """ % (
                name, self.size, n_atoms,
                hex(id(self))
                )
        return tmps

    def reverse(self):
        # should we just create a fake operator?
        cpp_reverse(self.frame_v.begin(), self.frame_v.end())

    def erase(self, int idx):
        # TODO : massive erase (idx_0, idx_1), slice(0:3:1)...
        # dealloc frame pointer too?
        self.frame_v.erase(self.frame_v.begin() + idx)
        
    @property
    def size(self):
        return self.frame_v.size()

    def __len__(self):
        return self.size

    def __iter__(self):
        """return a reference of Frame instance
        >>> for frame in FrameArray_instance:
        >>>     pass
                
        """
        cdef vector[_Frame].iterator it  = self.frame_v.begin()
        cdef Frame frame 

        while it != self.frame_v.end():
            frame = Frame()
            # use memoryview, don't let python free memory of this instance
            frame.py_free_mem = False
            frame.thisptr = &(deref(it))
            yield frame
            incr(it)

    def __add__(self, FrameArray other):
        self += other
        return self

    def __iadd__(self, FrameArray other):
        """
        append `other`'s frames to `self`
        frame0 += other
        """
        cdef _Frame _frame
        if self.top.n_atoms != other.top.n_atoms:
            raise ValueError("n_atoms of two arrays do not match")

        for _frame in other.frame_v:
            # make a copy
            self.frame_v.push_back(_Frame(_frame))
        return self

    def append(self, Frame framein, copy=True):
        cdef Frame frame = Frame() 
        if copy:
            frame = framein.copy()
            self.frame_v.push_back(frame.thisptr[0])
        else:
            # create memory view
            # need to set `py_free_mem` to False
            framein.py_free_mem = False
            self.frame_v.push_back(framein.thisptr[0])

    def join(self, *args):
        """join multiple FrameArray instances"""
        for arg in args:
            self._join(arg)

    def _join(self, FrameArray other):
        # TODO : do we need this method when we have `get_frames`
        if self.top.n_atoms != other.top.n_atoms:
            raise ValueError("n_atoms of two arrays do not match")
        self.frame_v.reserve(self.frame_v.size() + other.frame_v.size())
        self.frame_v.insert(self.frame_v.end(), 
                            other.frame_v.begin(), other.frame_v.end())

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
        cdef int start, stop, step
        cdef Frame frame

        if update_top:
            self.top = ts.top.copy()

        if not update_top:
            if self.top.n_atoms != ts.top.n_atoms:
                raise ValueError("FrameArray.top.n_atoms should be equal to Trajin_Single.top.n_atoms or set update_top=True")

        if isinstance(ts, Trajin_Single) or isinstance(ts, Trajectory):
            if indices:
                # slow method
                # TODO : use `for idx in leng(indices)`?
                if isinstance(indices, slice):
                    # use slice for saving memory
                    start, stop, step = indices.start, indices.stop, indices.step
                    for i in range(start, stop, step):
                        self.append(ts[i])
                else:
                    # regular list, tuple, array,...
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

        #elif isinstance(ts, FrameArray2) or isinstance(ts, FrameArray):
        elif isinstance(ts, FrameArray):
            # TODO : rename FrameArray2
            # use try and except?
            if not indices:
                for i in range(ts.size):
                    # TODO : make indices as an array?
                    self.append(ts[i])
            else:
                for i in range(ts.size):
                    if i in indices:
                    # TODO : make indices as an array?
                        self.append(ts[i])

    def strip_atoms(self, mask=None, update_top=True, bint has_box=False):
        """if you use memory for numpy, you need to update after resizing Frame
        >>> arr0 = np.asarray(frame.buffer)
        >>> frame.strip_atoms(top,"!@CA")
        >>> # update view
        >>> arr0 = np.asarray(frame.buffer)
        """

        cdef vector[_Frame].iterator it
        cdef Frame frame = Frame()
        cdef Topology tmptop = Topology()

        if mask == None: 
            raise ValueError("Must provide mask to strip")

        # do not dealloc since we use memoryview for _Frame
        frame.py_free_mem = False
        it = self.frame_v.begin()
        while it != self.frame_v.end():
            frame.thisptr = &(deref(it))
            # we need to update topology since _strip_atoms will modify it
            tmptop = self.top.copy()
            frame._strip_atoms(tmptop, mask, update_top, has_box)
            incr(it)
        if update_top:
            self.top = tmptop.copy()
