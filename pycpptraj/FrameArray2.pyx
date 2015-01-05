# distutils: language = c++


cdef class FrameArray2(DataSet_Coords):
    def __cinit__(self):
        # TODO : do we really need to epoxe _DataSet and _DataSet_1D?
        self.baseptr0 = <_DataSet*> new _DataSet_Coords_TRJ()
        # recast
        self.baseptr_1 = <_DataSet_1D*> self.baseptr0
        self.baseptr_2 = <_DataSet_Coords*> self.baseptr0
        self.thisptr = <_DataSet_Coords_TRJ*> self.baseptr0

    def __dealloc__(self):
        del self.thisptr

    def _recast(self):
        self.baseptr0 = <_DataSet*> self.thisptr
        self.baseptr_1 = <_DataSet_1D*> self.thisptr
        self.baseptr_2 = <_DataSet_Coords*> self.thisptr

    def alloc(self):
        cdef DataSet dset = DataSet()
        dset.baseptr0 = self.thisptr.Alloc()
        return dset

    def load(FrameArray2 self, string fname, Topology top=Topology(), ArgList arglist=ArgList()):
        if top.is_empty():
            if not self.top.is_empty():
                top = self.top
            else:
                raise ValueError("need to have non-empty topology file")
        if self.top.is_empty() and not top.is_empty():
            print "assigning new non-empty Topology"
            self.top = top
        return self.thisptr.AddSingleTrajin(fname, arglist.thisptr[0], top.thisptr)

    def add_input_trajin(self,Trajin trajin):
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

    def add_frame(self, Frame fIn):
        self.thisptr._AddFrame(fIn.thisptr[0])

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

