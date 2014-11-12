# distutils: language = c++
from ArgList cimport *
from DataSetList cimport *
from CpptrajFile cimport *
from BaseIOtype cimport *


cdef extern from "DataIO.h": 
    cdef cpplass _DataIO "DataIO":
        _DataIO() : valid1d_(false ), valid2d_(false ), valid3d_(false)
        _DataIO(bint v1, bint v2, bint v3): valid1d_(v1 ), valid2d_(v2 ), valid3d_(v3)
        bint CheckValidFor(const _DataSet&)const 
