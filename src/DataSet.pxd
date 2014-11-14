# distutil: language = c++
from libcpp.vector cimport vector
from Dimension cimport *

cdef extern from "DataSet.h":
    ctypedef enum DataType "DataSet::DataType":
        pass
    cdef cppclass _DataSet "DataSet":
        _DataSet()
