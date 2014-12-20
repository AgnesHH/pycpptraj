# distutils: language = c++

# can't not compile since _DataSet is abstract class

cdef class DataSet:
    """
    Original doc from cpptraj:
    =========================
    Class: DataSet
        Base class that all DataSet types will inherit.
        DataSets are given certain attributes to make DataSet selection easier; 
        these are name, index, and aspect. Name is typically associated with the
        action that creates the DataSet, e.g. RMSD or distance. Index is used
        when and action outputs subsets of data, e.g. with RMSD it is possible to 
        output per-residue RMSD, where the DataSet index corresponds to the residue
        number. Aspect is used to further subdivide output data type; e.g. with 
        nucleic acid analysis each base pair (divided by index) has shear,
        stagger etc calculated.
    """

    def __cinit__(self):
        pass
        # don't create instance for this abstract class
        #self.baseptr = new _DataSet()

    def __dealloc__(self):
        pass
        # let sub-class do this job
        #if self.baseptr != NULL:
        #    del self.baseptr

    #def DataSet(self,DataType, int, int, int):

    def set_width(self,int widthIn):
        self.baseptr.SetWidth(widthIn)

    def set_precision(self, int widthIn , int precisionIno):
        self.baseptr.SetPrecision(widthIn, precisionIno)

    def setup_set(self, string nameIn, int idxIn, string aspectIn):
        return self.baseptr.SetupSet(nameIn, idxIn, aspectIn)

    def set_legend(self, string lIn):
        self.baseptr.SetLegend(lIn)

    def set_scalar(self, scalarMode mIn):
        self.baseptr.SetScalar(mIn)

    def set_dim(self,DimIdxType i, Dimension d):
        self.baseptr.SetDim(i, d.thisptr[0])

    def set_scalar(self,scalarMode mIn, scalarType mT):
        self.baseptr.SetScalar(mIn, mT)

    def set_data_set_format(self, bint leftAlignIn):
        return self.baseptr.SetDataSetFormat(leftAlignIn)

    def matches(self, string dsname, int idxnum, string aspectIn):
        return self.baseptr.Matches(dsname, idxnum, aspectIn)

    def scalar_description(self):
        self.baseptr.ScalarDescription()

    def empty(self):
        return self.baseptr.Empty()

    @property
    def legend(self):
        return self.baseptr.Legend()
    
    @property
    def name(self):
        return self.baseptr.Name()

    @property
    def idx(self):
        return self.baseptr.Idx()
    
    @property
    def aspect(self):
        return self.baseptr.Aspect()

    @property
    def column_width(self):
        return self.baseptr.ColumnWidth()
    
    @property
    def data_type(self):
        return self.baseptr.Type()

    @property
    def scalar_mode(self):
        return self.baseptr.ScalarMode()

    @property
    def scalar_type(self):
        return self.baseptr.ScalarType()

    @property 
    def ndim(self):
        return self.baseptr.Ndim()

    def dim(self,int i):
        # TODO: what does this do?
        cdef Dimension dim = Dimension()
        dim.thisptr[0] = self.baseptr.Dim(i)

    def __richcmp__(DataSet self, DataSet other, opt):
        if opt == 0:
            # operator "<"
            return self.baseptr[0] < other.baseptr[0]
        else:
            raise NotImplemented()

    @property
    def data_format(self):
        return self.baseptr.DataFormat()
