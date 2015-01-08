# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class DataFileList:
    def __cinit__(self, py_free_mem=True):
        self.thisptr = new _DataFileList()
        self.py_free_mem = py_free_mem

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    def clear(self):
        self.thisptr.Clear()

    def remove_data_file(self, DataFile dfIn):
        cdef DataFile dfile = DataFile()
        dfile.thisptr[0] = deref(self.thisptr.RemoveDataFile(dfIn.thisptr))
        return dfile

    def remove_data_set(self,DataSet dsIn):
        self.thisptr.RemoveDataSet(dsIn.baseptr0)
        
    def set_debug(self, int debug):
        self.thisptr.SetDebug(debug)

    # this method is for MPI. 
    #def set_ensemble_mode(self,int mIn):
    #    self.thisptr.SetEnsembleNum(mIn)

    def get_data_file(self, string nameIn):
        cdef DataFile dfile = DataFile()
        dfile.py_free_mem = False
        dfile.thisptr = self.thisptr.GetDataFile(nameIn)
        return dfile

    def add_data_file(self, string nameIn, *args):
        cdef DataFile dfile = DataFile()
        cdef ArgList argIn

        if not args:
            dfile.thisptr[0] = deref(self.thisptr.AddDataFile(nameIn))
        else:
            argIn = args[0]
            dfile.thisptr[0] = deref(self.thisptr.AddDataFile(nameIn, argIn.thisptr[0]))
        return dfile

    def add_set_to_file(self, string nameIn, DataSet dsetIn):
        cdef DataFile dfile = DataFile()
        dfile.thisptr[0] = deref(self.thisptr.AddSetToFile(nameIn, dsetIn.baseptr0))
        return dfile

    def list(self):
        self.thisptr.List()

    def write_all_datafiles(self):
        self.thisptr.WriteAllDF()

    def reset_write_status(self):
        self.thisptr.ResetWriteStatus()

    def process_data_file_args(self, ArgList argIn):
        return self.thisptr.ProcessDataFileArgs(argIn.thisptr[0])

