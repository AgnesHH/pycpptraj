# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from ArgList cimport *
from DataSetList cimport *
from CpptrajFile cimport *
from BaseIOtype cimport *


cdef extern from "DataIO.h": 
    cdef cppclass DataIO "DataIO":
        DataIO()
        DataIO(bint v1, bint v2, bint v3)
        bint CheckValidFor(const DataSet&) const 
