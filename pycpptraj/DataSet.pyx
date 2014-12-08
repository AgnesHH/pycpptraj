# distutils: language = c++

# can't not compile since _DataSet is abstract class

cdef class DataSet:
    def __cinit__(self):
        pass
        # don't create instance for this abstract class
        #self.thisptr = new _DataSet()

    def __dealloc__(self):
        if self.thisptr != NULL:
            del self.thisptr

    #def DataSet(self,DataType, int, int, int):

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

    def Empty(self):
        return self.thisptr.Empty()

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

    def Dim(self,int i):
        cdef Dimension dim = Dimension()
        dim.thisptr[0] = self.thisptr.Dim(i)

    # def  bint operator[(self, DataSet):
    def __richcmp__(DataSet self, DataSet other, opt):
        if opt == 0:
            # operator "<"
            return self.thisptr[0] < other.thisptr[0]
        else:
            raise NotImplemented()

    @property
    def DataFormat(self):
        return self.thisptr.DataFormat()
