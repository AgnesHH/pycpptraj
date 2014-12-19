# distutils: language = c++
include "config.pxi"
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr


cdef class DataSetList:
    def __cinit__(self):
        self.thisptr = new _DataSetList()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    #def DataSetList operator +=(self, DataSetList):
    #def _iterator begin(self):
    #def _iterator end(self):

    def empty(self):
        return self.thisptr.empty()

    property size:
        def __get__(self):
            return self.thisptr.size()

    def EnsembleNum(self):
        return self.thisptr.EnsembleNum()

    #def void RemoveSet(self,_iterator):
    #def void RemoveSet(self,DataSet *):

    #def DataSet * operator[](self,int didx):
    def __getitem__(self, int idx):
        cdef DataSet dset = DataSet()
        dset.thisptr[0] = deref(self.thisptr.index_opr(idx))
        return dset

    def SetDebug(self,int id):
        self.thisptr.SetDebug(id)

    def SetEnsembleNum(self,int i):
        self.thisptr.SetEnsembleNum(i)

    def AllocateSets(self,long int i):
        self.thisptr.AllocateSets(i)

    def SetPrecisionOfDataSets(self, string nameIn, int widthIn, int precisionIn):
        self.thisptr.SetPrecisionOfDataSets(nameIn, widthIn, precisionIn)

    #def DataSet * GetSet(self, string, int, string):

    #def DataSet * GetDataSet(self, string):

    def GetMultipleSets(self, string s):
        """TODO: double-check cpptraj"""
        cdef DataSetList dlist = DataSetList()
        dlist.thisptr[0] = self.thisptr.GetMultipleSets(s)
        return dlist

    def GenerateDefaultName(self, char* s):
        return self.thisptr.GenerateDefaultName(s)

    def AddSet(self,DataType dtype, string s, char * c):
        cdef DataSet dset = DataSet()
        dset.thisptr[0] = self.thisptr.AddSet(dtype, s, c)[0]
        return dset
        
    #def DataSet * AddSetIdx(self,DataSet::DataType, string, int):

    #def DataSet * AddSetAspect(self,DataSet::DataType, string, string):

    #def DataSet * AddSetIdxAspect(self,DataSet::DataType, string, int, string):

    #def DataSet * AddSetIdxAspect(self,DataSet::DataType, string, int, string, string):

    #def void AddCopyOfSet(self,DataSet *):

    def List(self):
        self.thisptr.List()

    #def DataSet * FindSetOfType(self, string, DataSet::DataType):

    #def DataSet * FindCoordsSet(self, string):
