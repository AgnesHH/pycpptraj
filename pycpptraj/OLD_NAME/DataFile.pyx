# distutils: language = c++

from ArgList cimport ArgList
from DataSetList cimport DataSetList

cdef class DataFile:
    def __cinit__(self):
        self.thisptr = new _DataFile()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def WriteHelp(self):
        self.thisptr.WriteHelp()

    def ReadOptions(self):
        self.thisptr.ReadOptions()

    def WriteOptions(self):
        self.thisptr.WriteOptions()

    def GetFormatFromArg(self,ArgList a):
        return self.thisptr.GetFormatFromArg(a.thisptr[0])

    def FormatString(self,DataFormatType t=DATAFILE):
        return self.thisptr.FormatString(t)

    def SetDebug(self,int i):
        self.thisptr.SetDebug(i)

    def SetDataFilePrecision(self, int widthIn, int precisionIn):
        self.thisptr.SetDataFilePrecision(widthIn, precisionIn)

    def ReadDataIn(self, string fnameIn, ArgList argListIn, DataSetList datasetlist):
        return self.thisptr.ReadDataIn(fnameIn.thisptr[0], argListIn.thisptr[0], datasetlist.thisptr[0])

    def SetupDatafile(self, string fnameIn, ArgList argIn, int debugIn):
        return self.thisptr.SetupDatafile(fnameIn, argIn.thisptr[0], debugIn)

    #def AddSet(self,DataSet dataIn):
    #    # DataSet has virtual method
    #    # How can I add here?
    #    return self.thisptr.AddSet(dataIn.thisptr)

    #def RemoveSet(self,DataSet dataIn):
    #    return self.thisptr.RemoveSet(dataIn.thisptr)

    def ProcessArgs(self, arg):
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

    def WriteData(self):
        self.thisptr.WriteData()

    def DataSetNames(self):
        self.thisptr.DataSetNames()

    def SetDFLwrite(self,bint fIn):
        self.thisptr.SetDFLwrite(fIn)

    def DFLwrite(self):
        return self.thisptr.DFLwrite()

    property data_format_type:
        def __get__(self):
            return self.thisptr.Type()
