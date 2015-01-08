# distutils: language = c++
from ArgList cimport *
from datasets.DataSet cimport *
#from DataSetList cimport *
from CpptrajFile cimport *
from BaseIOtype cimport *


cdef extern from "DataIO.h": 
    #abstract class
    cdef cppclass _DataIO "DataIO":
        _DataIO()
        _DataIO(bint v1, bint v2, bint v3)
        bint CheckValidFor(const _DataSet&)const 
