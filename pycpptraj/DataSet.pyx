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
        #self.thisptr = new _DataSet()

    def __dealloc__(self):
        pass
        # let sub-class do this job
        #if self.thisptr != NULL:
        #    del self.thisptr

    #def DataSet(self,DataType, int, int, int):

    def set_width(self,int widthIn):
        self.thisptr.SetWidth(widthIn)

    def set_precision(self, int widthIn , int precisionIno):
        self.thisptr.SetPrecision(widthIn, precisionIno)

    def setup_set(self, string nameIn, int idxIn, string aspectIn):
        return self.thisptr.SetupSet(nameIn, idxIn, aspectIn)

    def set_legend(self, string lIn):
        self.thisptr.SetLegend(lIn)

    def set_scalar(self, scalarMode mIn):
        self.thisptr.SetScalar(mIn)

    def set_dim(self,DimIdxType i, Dimension d):
        self.thisptr.SetDim(i, d.thisptr[0])

    def set_scalar(self,scalarMode mIn, scalarType mT):
        self.thisptr.SetScalar(mIn, mT)

    def set_data_set_format(self, bint leftAlignIn):
        return self.thisptr.SetDataSetFormat(leftAlignIn)

    def matches(self, string dsname, int idxnum, string aspectIn):
        return self.thisptr.Matches(dsname, idxnum, aspectIn)

    def scalar_description(self):
        self.thisptr.ScalarDescription()

    def empty(self):
        return self.thisptr.Empty()

    @property
    def legend(self):
        return self.thisptr.Legend()
    
    @property
    def name(self):
        return self.thisptr.Name()

    @property
    def idx(self):
        return self.thisptr.Idx()
    
    @property
    def aspect(self):
        return self.thisptr.Aspect()

    @property
    def column_width(self):
        return self.thisptr.ColumnWidth()
    
    @property
    def data_type(self):
        return self.thisptr.Type()

    @property
    def scalar_mode(self):
        return self.thisptr.ScalarMode()

    @property
    def scalar_type(self):
        return self.thisptr.ScalarType()

    @property 
    def ndim(self):
        return self.thisptr.Ndim()

    def dim(self,int i):
        # TODO: what does this do?
        cdef Dimension dim = Dimension()
        dim.thisptr[0] = self.thisptr.Dim(i)

    def __richcmp__(DataSet self, DataSet other, opt):
        if opt == 0:
            # operator "<"
            return self.thisptr[0] < other.thisptr[0]
        else:
            raise NotImplemented()

    @property
    def data_format(self):
        return self.thisptr.DataFormat()
