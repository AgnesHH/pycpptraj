# distutils: language = c++


cdef class DataSet_MatrixDbl (DataSet_2D):
    def __cinit__(self):
        self.thisptr = new _DataSet_MatrixDbl()
        self.py_free_mem = True

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    #def DataSet_MatrixDbl(self):

    #def double operator[](self,size_t idx):

    #def DataSet * Alloc(self):

    #def size_t Size(self):

    #def int Sync(self):

    #def void Info(self):

    #def int Allocate2D(self,size_t x, size_t y):

    #def int AllocateHalf(self,size_t x):

    #def int AllocateTriangle(self,size_t x):

    #def void Write2D(self,CpptrajFile, int, int):

    #def double GetElement(self,size_t x, size_t y):

    #def size_t Nrows(self):
    #def size_t Ncols(self):

    #def double * MatrixArray(self):
    #def MatrixKind Kind(self):
    #def MatrixType Type(self):

    def element(self, size_t x, size_t y):
        return self.thisptr.Element(x, y)

    #def int AddElement(self,double d):

    #def void SetElement(self,size_t x, size_t y, double d):

    #def iterator begin(self):

    #def iterator end(self):

    def vect(self):
        return self.thisptr.Vect()

    #def Darray V1(self):

    #def void AllocateVector(self,size_t vsize):

    #def Darray::iterator v1begin(self):

    #def Darray::iterator v1end(self):

    #def void SetTypeAndKind(self,MatrixType tIn, MatrixKind kIn):

    #def void StoreMass(self, Darray mIn):

    #def  Darray Mass(self):

