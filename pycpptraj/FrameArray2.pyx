# distutils: language = c++
from pycpptraj.trajs.Trajin cimport Trajin
from pycpptraj.Trajin_Single cimport Trajin_Single
from pycpptraj.FrameArray cimport FrameArray
from pycpptraj._utils cimport get_positive_idx

# experimental wrapperr for DataSet_Coords_TRJ class
# see also ./datasets/DataSet_Coords_TRJ.pyx


cdef class FrameArray2(DataSet_Coords):
    # TODO : how to change internal data for this cpptraj class
    """Readonly FrameArray2
    This class is actually just alias of DataSet_Coords_TRJ class
    """
    def __cinit__(self, *args):
        # TODO : do we really need to epoxe _DataSet and _DataSet_1D?
        self.baseptr0 = <_DataSet*> new _DataSet_Coords_TRJ()
        # recast
        self.baseptr_1 = <_DataSet_1D*> self.baseptr0
        self.baseptr_2 = <_DataSet_Coords*> self.baseptr0
        self.thisptr = <_DataSet_Coords_TRJ*> self.baseptr0

    def __dealloc__(self):
        del self.thisptr

    def copy(FrameArray2 self, warning=True):
        # TODO : make sure to change class's name here if you every want to
        # have better name
        raise NotImplementedError()
    
    def __iter__(FrameArray2 self):
        """iterately getting Frame instance
        TODO : get memoery view or copy?
        """
        cdef int i 
        cdef Frame frame
        frame = self.allocate_frame()

        for i in range(self.size):
            self.thisptr._GetFrame(i, frame.thisptr[0])
            yield frame

    def __getitem__(FrameArray2 self, idxs):
        # TODO : same as Trajin class
        # should combine or inherit or ?
        # return either a Frame instance or FrameArray instance
        

        cdef Frame frame
        cdef FrameArray farray
        cdef int start, stop, step
        cdef int i
        cdef int idx_1

        frame = self.allocate_frame()

        frame.py_free_mem = True

        if self.size == 0:
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
            self.thisptr._GetFrame(idx_1, frame.thisptr[0])
            return frame
        else:
            # creat a subset array of `FrameArray`
            farray = FrameArray()
            farray.top = self.top
            if idxs.step == None:
                step = 1
            else:
                step = idxs.step
            if idxs.stop == None:
                stop = self.size
            else:
                stop = idxs.stop
            if idxs.start == None:
                start = 0
            else:
                start = idxs.start

            for i in range(start, stop, step):
                # turn `copy` to `False` to have memoryview
                farray.append(self[i], copy=True)
            return farray

    def __setitem(self, int idx, value):
        raise NotImplementedError("Read only")

#    def __getitem__(FrameArray2 self, int idx):
#        """return a copy of Frame
#        NOTE : self[idx].buffer does not work (got zero coords if using
#        np.asarray(self[idx]) where `self` is FrameArray2 instance). 
#        Solution: creat a frame instance to hold self[idx], like frame = self[ixd]. 
#        Now you can use memoryview
#        TODO : fancy indexing
#        """
#        cdef Frame frame
#        frame = self.allocate_frame()
#        self.thisptr._GetFrame(idx, frame.thisptr[0])
#        return frame

    def _recast(self):
        self.baseptr0 = <_DataSet*> self.thisptr
        self.baseptr_1 = <_DataSet_1D*> self.thisptr
        self.baseptr_2 = <_DataSet_Coords*> self.thisptr

    def alloc(self):
        cdef DataSet dset = DataSet()
        dset.baseptr0 = self.thisptr.Alloc()
        return dset

    def load(FrameArray2 self, string filename, Topology top=Topology(), ArgList arglist=ArgList()):
        """load TRJ from file"""
        if top.is_empty():
            if not self.top.is_empty():
                top = self.top
            else:
                raise ValueError("need to have non-empty topology file")
        if self.top.is_empty() and not top.is_empty():
            print "assigning new non-empty Topology"
            self.top = top.copy()
        return self.thisptr.AddSingleTrajin(filename, arglist.thisptr[0], top.thisptr)

    def addframe(self, Frame frame):
        self.thisptr.AddFrame(frame.thisptr[0])

    def addtraj(self, trajin):
        """add Trajin instance"""
        # use FunctPtr so that trajin could be anything classes having `baseptr_1`
        # TODO : how to combine instead of using 2 temp variables?
        cdef Trajin trajin_
        cdef Trajin_Single trajinsingle

        if isinstance(trajin, Trajin):
            trajin_ = <Trajin> trajin
            self.thisptr.AddInputTraj(trajin_.baseptr_1)
        elif isinstance(trajin, Trajin_Single):
            trajinsingle = <Trajin_Single> trajin
            self.thisptr.AddInputTraj(trajinsingle.baseptr_1)

    @property
    def size(self):
        # TODO : add checking self.size = 0
        return self.thisptr.Size()

    def info(self):
        self.thisptr.Info()

    # use base class?
    #def allocate1D(self,size_t t):
    #    self.thisptr.Allocate1D(t)

    #def void Add(self,size_t, void *):

    #def double Dval(self,size_t):

    #def double Xcrd(self,size_t idx):

    #def void WriteBuffer(self,CpptrajFile, size_t):


    def set_crd(self,int idx, Frame fIn): 
        """"""
        raise NotImplementedError()

    def get_frame(self, int idx, Frame frame_in, *args):
        cdef AtomMask atm_in
        if self.top.n_atoms != frame_in.n_atoms:
            raise ValueError("n_atoms should be matched between Frame and Topology")
        if not args:
            self.thisptr._GetFrame(idx, frame_in.thisptr[0])
        else:
            atm_in = args[0]
            self.thisptr._GetFrame(idx, frame_in.thisptr[0], atm_in.thisptr[0])

