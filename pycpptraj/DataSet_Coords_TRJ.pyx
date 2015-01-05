# distutils: language = c++


cdef class DataSet_Coords_TRJ (DataSet_Coords):
    def __cinit__(self):
        self.thisptr = new _DataSet_Coords_TRJ()

    def __dealloc__(self):
        del self.thisptr

    def alloc(self):
        cdef DataSet dset = DataSet()
        dset.baseptr0 = self.thisptr.Alloc()
        return dset

    def add_single_trajin(self, string fname, ArgList arglist, Topology top):
        return self.thisptr.AddSingleTrajin(fname, arglist.thisptr[0], top.thisptr)

    def add_input_trajin(self,Trajin trajin):
        self.thisptr.AddInputTraj(trajin.baseptr_1)

    #def size_t Size(self):

    #def int Sync(self):

    #def void Info(self):

    #def int Allocate1D(self,size_t):

    #def void Add(self,size_t, void *):

    #def double Dval(self,size_t):

    #def double Xcrd(self,size_t idx):

    #def void WriteBuffer(self,CpptrajFile, size_t):

    #def add_frame(self, Frame fIn):
    #    self.thisptr.AddFrame(fIn.thisptr[0])

    def set_crd(self,int idx, Frame fIn): 
        pass

    def get_frame(self, int idx, Frame frame_in, *args):
        cdef AtomMask atm_in
        if not args:
            self.thisptr._GetFrame(idx, frame_in.thisptr[0])
        else:
            atm_in = args[0]
            self.thisptr._GetFrame(idx, frame_in.thisptr[0], atm_in.thisptr[0])
