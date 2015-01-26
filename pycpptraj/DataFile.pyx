# distutils: language = c++

from pycpptraj.cpptraj_dict import DataFormatDict

cdef class DataFile:
    def __cinit__(self, py_free_mem=True):
        self.thisptr = new _DataFile()
        self.py_free_mem = py_free_mem

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    @classmethod
    def write_help(cls):
        _DataFile.WriteHelp()

    @classmethod
    def read_options(cls):
        _DataFile.ReadOptions()

    @classmethod
    def write_options(cls):
        _DataFile.WriteOptions()

    @classmethod
    def get_format_from_arg(cls, ArgList a):
        return _DataFile.GetFormatFromArg(a.thisptr[0])

    #@classmethod
    def format_string(self, string t):
        cdef DataFormatType fmt = DataFormatDict[t]
        return self.thisptr.FormatString(fmt)

    def set_precision(self, int widthIn, int precisionIn):
        self.thisptr.SetDataFilePrecision(widthIn, precisionIn)

    def read_data(self, string filenameIn, ArgList argListIn, DataSetList datasetlist):
        return self.thisptr.ReadDataIn(filenameIn.thisptr[0], argListIn.thisptr[0], datasetlist.thisptr[0])

    def setup_datafile(self, string filenameIn, ArgList argIn, int debugIn):
        return self.thisptr.SetupDatafile(filenameIn, argIn.thisptr[0], debugIn)

    #def AddSet(self,DataSet dataIn):
    #    # DataSet has virtual method
    #    # How can I add here?
    #    return self.thisptr.AddSet(dataIn.thisptr)

    #def RemoveSet(self,DataSet dataIn):
    #    return self.thisptr.RemoveSet(dataIn.thisptr)

    def process_args(self, arg):
        cdef string s
        cdef ArgList argIn

        if isinstance(arg, basestring):
            s = <string> arg
            return self.thisptr.ProcessArgs(s)
        elif isinstance(arg, ArgList):
            argIn = <ArgList> arg
            return self.thisptr.ProcessArgs(argIn.thisptr[0])
        else:
            raise ValueError()

    def write_data(self):
        self.thisptr.WriteData()

    def data_set_names(self):
        self.thisptr.DataSetNames()

    def setDF_lwrite(self, bint fIn):
        self.thisptr.SetDFLwrite(fIn)

    def dF_lwrite(self):
        return self.thisptr.DFLwrite()

    property data_format_type:
        def __get__(self):
            return self.thisptr.Type()
