# distutils: language = c++


cdef class DataFileList:
    def __cinit__(self):
        self.thisptr = new _DataFileList()

    def __dealloc__(self):
        del self.thisptr

    #def DataFileList(self):

    #def void Clear(self):

    #def DataFile * RemoveDataFile(self,DataFile *):

    #def void RemoveDataSet(self,DataSet *):

    #def void SetDebug(self,int):

    #def void SetEnsembleMode(self,int mIn):

    #def DataFile * GetDataFile(self, string):

    #def DataFile * AddDataFile(self, string, ArgList):

    #def DataFile * AddDataFile(self, string):

    #def DataFile * AddSetToFile(self, string, DataSet *):

    #def void List(self):

    #def void WriteAllDF(self):

    #def void ResetWriteStatus(self):

    #def int ProcessDataFileArgs(self,ArgList):

