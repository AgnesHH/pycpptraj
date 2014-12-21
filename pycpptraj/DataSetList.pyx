# distutils: language = c++
include "config.pxi"
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from cpptraj_dict import DataTypeDict

cdef class DataSetList:
    def __cinit__(self, py_free_mem=True):
        # py_free_mem is a flag to tell pycpptraj should free memory or let 
        # cpptraj does
        # check ./CpptrajState.pyx
        self.thisptr = new _DataSetList()
        self.py_free_mem = py_free_mem

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    def clear(self):
        self.thisptr.Clear()

    def __iadd__(self, DataSetList other):

        self.thisptr.addequal(other.thisptr[0])
        return self

    def __iter__(self):
        cdef const_iterator it
        cdef DataSet dtset
        it = self.thisptr.begin()

        while it != self.thisptr.end():
            dtset = DataSet()
            dtset.baseptr = deref(it)
            yield dtset
            incr(it)
            
    def empty(self):
        return self.thisptr.empty()

    property size:
        def __get__(self):
            return self.thisptr.size()

    def ensemble_num(self):
        return self.thisptr.EnsembleNum()

    def remove_set(self, DataSet dtset):
        self.thisptr.RemoveSet(dtset.baseptr)

    def __getitem__(self, int idx):
        cdef DataSet dset = DataSet()
        # get memoryview
        dset.baseptr = self.thisptr.index_opr(idx)
        return dset

    def set_debug(self,int id):
        self.thisptr.SetDebug(id)

    def set_ensemble_num(self,int i):
        self.thisptr.SetEnsembleNum(i)

    def allocate_sets(self,long int i):
        self.thisptr.AllocateSets(i)

    def set_precision_of_data_sets(self, string nameIn, int widthIn, int precisionIn):
        self.thisptr.SetPrecisionOfDataSets(nameIn, widthIn, precisionIn)

    def GetSet(self, string dsname, int idx, string attr_arg):
        cdef DataSet dset = DataSet()
        dset.baseptr = self.thisptr.GetSet(dsname, idx, attr_arg)

    def GetDataSet(self, string nameIn):
        """
        return DataSet instance
        Input:
        =====
        filename :: str
        """
        cdef DataSet dset = DataSet()
        dset.baseptr = self.thisptr.GetDataSet(nameIn)
        return dset

    def get_multiple_sets(self, string s):
        """TODO: double-check cpptraj"""
        cdef DataSetList dlist = DataSetList()
        dlist.thisptr[0] = self.thisptr.GetMultipleSets(s)
        return dlist

    # why need this?
    #def generate_default_name(self, char* s):
    #    return self.thisptr.GenerateDefaultName(s)

    def add_set(self,DataType dtype, string s, char * c):
        # TODO: check cpptraj for this method
        cdef DataType dt = <DataType> DataTypeDict[dtype] 
        cdef DataSet dset = DataSet()
        dset.baseptr = self.thisptr.AddSet(dt, s, c)
        return dset
        
    #def DataSet * AddSetIdx(self,DataSet::DataType, string, int):

    #def DataSet * AddSetAspect(self,DataSet::DataType, string, string):

    #def DataSet * AddSetIdxAspect(self,DataSet::DataType, string, int, string):

    #def DataSet * AddSetIdxAspect(self,DataSet::DataType, string, int, string, string):

    def AddCopyOfSet(self, DataSet dset):
        self.thisptr.AddCopyOfSet(dset.baseptr)

    def list(self):
        self.thisptr.List()

    # got segfault
    def find_set_of_type(self, string fname, string key):
        cdef DataType dtype = <DataType> DataTypeDict[key]
        cdef DataSet dtset = DataSet()
        dtset.baseptr = self.thisptr.FindSetOfType(fname, dtype)
        return dtset

    def find_coords_set(self, string fname):
        cdef DataSet dtset = DataSet()
        #dtset.baseptr = self.thisptr.FindCoordsSet(fname)
        dtset.baseptr[0] = (self.thisptr.FindCoordsSet(fname))[0]
        return dtset
