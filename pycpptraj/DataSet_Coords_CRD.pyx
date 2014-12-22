# distutils: language = c++


cdef class DataSet_Coords_CRD (DataSet_Coords):
    def __cinit__(self):
        self.thisptr = new _DataSet_Coords_CRD()
        self.baseptr0 = <_DataSet*> self.thisptr
        self.baseptr_2 = <_DataSet_Coords*> self.thisptr
        self.baseptr_1 = <_DataSet_1D*> self.thisptr

    def __dealloc__(self):
        del self.thisptr

    #def DataSet_Coords_CRD(self):

    #def DataSet * Alloc(self):

    #def size_t Size(self):

    #def int Sync(self):

    #def void Info(self):

    #def int Allocate1D(self,size_t):

    #def void Add(self,size_t, void *):

    #def double Dval(self,size_t):

    #def double Xcrd(self,size_t idx):

    #def void WriteBuffer(self,CpptrajFile, size_t):

    #def  void AddFrame(self, Frame fIn):

    #def  void GetFrame(self,int idx, Frame fIn):

    #def  void GetFrame(self,int idx, Frame fIn, AtomMask mIn):

    #def  void SetCRD(self,int idx, Frame fIn):

