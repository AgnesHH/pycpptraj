# distutils: language = c++


cdef class DataSet_double (DataSet_1D):
    def __cinit__(self):
        self.baseptr0 = <_DataSet*> new _DataSet_double()
        # make sure 3 pointers pointing to the same address?
        self.baseptr_1 = <_DataSet_1D*> self.baseptr0
        self.thisptr = <_DataSet_double*> self.baseptr0

        # let Python/Cython free memory
        self.py_free_mem = True

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    #def DataSet_double(self):

    def alloc(self):
        '''return a memoryview as DataSet instane'''
        cdef DataSet dset = DataSet()
        dset.baseptr0 = self.thisptr.Alloc()
        return dset

    def __getitem__(self, int idx):
        return self.thisptr.index_opr(idx)

    def __setitem__(self, int idx, double value):
        cdef double* ptr
        ptr = &(self.thisptr.index_opr(idx))
        ptr[0] = value

    #def double operator[](self,size_t idx):

    @property
    def data(self):
        return self.thisptr.Data()

    #def void AddElement(self,double d):

    #def void Resize(self,size_t sizeIn):

    @property
    def size(self):
        return self.thisptr.Size()

    #def int Sync(self):

    #def void Info(self):

    #def int Allocate1D(self,size_t):

    #def void Add(self,size_t, void *):

    #def double Dval(self,size_t idx):

    #def double Xcrd(self,size_t idx):

    #def void WriteBuffer(self,CpptrajFile, size_t):

    #def void Append(self, DataSet_double):

    #def iterator begin(self):

    #def iterator end(self):

    #def void SetNOE(self,double b, double bh, double r):

    #def double NOE_bound(self):

    #def double NOE_boundH(self):

    #def double NOE_rexp(self):

    #def void ShiftTorsions(self,double, double):

