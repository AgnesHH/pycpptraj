# distutils: language = c++


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

    def __getitem__(FrameArray2 self, int idx):
        """return a copy of Frame
        NOTE : self[idx].buffer does not work (got zero coords if using
        np.asarray(self[idx]) where `self` is FrameArray2 instance
        ). Solution: creat a frame instance to hold self[idx], like frame = self[ixd]. 
        Now you can use memoryview
        """
        cdef Frame frame
        frame = self.allocate_frame()
        self.thisptr._GetFrame(idx, frame.thisptr[0])
        return frame

    def _recast(self):
        self.baseptr0 = <_DataSet*> self.thisptr
        self.baseptr_1 = <_DataSet_1D*> self.thisptr
        self.baseptr_2 = <_DataSet_Coords*> self.thisptr

    def alloc(self):
        cdef DataSet dset = DataSet()
        dset.baseptr0 = self.thisptr.Alloc()
        return dset

    def load(FrameArray2 self, string fname, Topology top=Topology(), ArgList arglist=ArgList()):
        """load TRJ from file"""
        if top.is_empty():
            if not self.top.is_empty():
                top = self.top
            else:
                raise ValueError("need to have non-empty topology file")
        if self.top.is_empty() and not top.is_empty():
            print "assigning new non-empty Topology"
            self.top = top
        return self.thisptr.AddSingleTrajin(fname, arglist.thisptr[0], top.thisptr)

    def addtraj(self, Trajin trajin):
        """add Trajin instance"""
        self.thisptr.AddInputTraj(trajin.baseptr_1)

    @property
    def size(self):
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
        pass

    def get_frame(self, int idx, Frame frame_in, *args):
        cdef AtomMask atm_in
        if self.top.n_atoms != frame_in.n_atoms:
            raise ValueError("n_atoms should be matched between Frame and Topology")
        if not args:
            self.thisptr._GetFrame(idx, frame_in.thisptr[0])
        else:
            atm_in = args[0]
            self.thisptr._GetFrame(idx, frame_in.thisptr[0], atm_in.thisptr[0])

