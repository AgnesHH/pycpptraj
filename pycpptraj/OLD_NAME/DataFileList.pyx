# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class DataFileList:
    def __cinit__(self):
        self.thisptr = new _DataFileList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def RemoveDataFile(self,DataFile dfIn):
        cdef DataFile dfile = DataFile()
        dfile.thisptr[0] = self.RemoveDataFile(dfIn.thisptr)
        return dfile

    def RemoveDataSet(self,DataSet dsIn):
        self.thisptr.RemoveDataSet(dsIn.thisptr)
        
    def SetDebug(self, int debug):
        self.thisptr.SetDebug(debug)

    def SetEnsembleMode(self,int mIn):
        self.thisptr.SetEnsembleMode(mIn)

    def GetDataFile(self, string nameIn):
        cdef DataFile dfile = DataFile()
        dfile.thisptr[0] = deref(self.thisptr.GetDataFile(nameIn))
        return dfile

    def AddDataFile(self, string nameIn, argIn=None):
        cdef DataFile dfile = DataFile()
        if argIn is None:
            dfile.thisptr[0] = self.thisptr.AddDataFile(nameIn)
        else:
            argIn = <ArgList> argIn
            dfile.thisptr[0] = self.thisptr.AddDataFile(nameIn, argIn.thisptr[0])
        return dfile

    def AddSetToFile(self, string nameIn, DataSet dsetIn):
        cdef DataFile dfile = DataFile()
        dfile.thisptr[0] = self.thisptr.AddSetToFile(nameIn, dsetIn.thisptr)
        return dfile

    def List(self):
        self.thisptr.List()

    def WriteAllDF(self):
        self.thisptr.WriteAllDF()

    def ResetWriteStatus(self):
        self.thisptr.ResetWriteStatus()

    def ProcessDataFileArgs(self, ArgList argIn):
        return self.thisptr.ProcessDataFileArgs(argIn.thisptr[0])

