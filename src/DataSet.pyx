# distutils: language = c++

# can't not compile since _DataSet is abstract class

cdef class DataSet:
    def __cinit__(self):
        self.thisptr = new _DataSet()

    def __dealloc__(self):
        del self.thisptr

    #def DataSet(self,DataType, int, int, int):

    # def DataSet(self, DataSet):
    @classmethod
    def copy(cls, DataSet other):
        cdef DataSet dset = DataSet()
        #del dset.thisptr
        dset.thisptr = new _DataSet(other.thisptr[0])
        return dset

    def copy(self, DataSet other):
        #del self.thisptr
        self.thisptr = new _DataSet(other.thisptr[0])

    def SetWidth(self,int widthIn):
        self.thisptr.SetWidth(widthIn)

    def SetPrecision(self, int widthIn , int precisionIno):
        self.thisptr.SetPrecision(widthIn, precisionIno)

    def SetupSet(self, string nameIn, int idxIn, string aspectIn):
        return self.thisptr.SetupSet(nameIn, idxIn, aspectIn)

    def SetLegend(self, string lIn):
        self.thisptr.SetLegend(lIn)

    def SetScalar(self, scalarMode mIn):
        self.thisptr.SetScalar(mIn)

    def SetDim(self,DimIdxType i, Dimension d):
        self.thisptr.SetDim(i, d.thisptr[0])

    def SetScalar(self,scalarMode mIn, scalarType mT):
        self.thisptr.SetScalar(mIn, mT)

    def SetDataSetFormat(self, bint leftAlignIn):
        return self.thisptr.SetDataSetFormat(leftAlignIn)

    def Matches(self, string dsname, int idxnum, string aspectIn):
        return self.thisptr.Matches(dsname, idxnum, aspectIn)

    def ScalarDescription(self):
        self.thisptr.ScalarDescription()

    #def Empty(self):
    #    return self.thisptr.Empty()

    @property
    def Legend(self):
        return self.thisptr.Legend()
    
    @property
    def Name(self):
        return self.thisptr.Name()

    @property
    def Idx(self):
        return self.thisptr.Idx()
    
    @property
    def Aspect(self):
        return self.thisptr.Aspect()

    @property
    def ColumnWidth(self):
        return self.thisptr.ColumnWidth()
    
    @property
    def data_type(self):
        return self.thisptr.Type()

    @property
    def ScalarMode(self):
        return self.thisptr.ScalarMode()

    @property
    def ScalarType(self):
        return self.thisptr.ScalarType()

    @property 
    def Ndim(self):
        return self.thisptr.Ndim()

    #def Dimension Dim(self,DimIdxType i):

    #def Dimension Dim(self,int i):

    #def Dimension Dim(self,int i):

    # def  bint operator[(self, DataSet):
    @property
    def DataFormat(self):
        return self.thisptr.DataFormat()
