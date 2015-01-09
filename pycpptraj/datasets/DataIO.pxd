# distutils: language = c++
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.datasets.DataSet cimport _DataSet, DataSet
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.CpptrajFile cimport _CpptrajFile, CpptrajFile
from pycpptraj.BaseIOtype cimport _BaseIOtype, BaseIOtype


cdef extern from "DataIO.h": 
    #abstract class
    cdef cppclass _DataIO "DataIO":
        _DataIO()
        _DataIO(bint v1, bint v2, bint v3)
        bint CheckValidFor(const _DataSet&)const 
