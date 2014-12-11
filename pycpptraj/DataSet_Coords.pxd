# distutils: language = c++
from Topology cimport *
from DataSet cimport *
from DataSet_1D cimport *


cdef extern from "DataSet_Coords.h": 
    cdef cppclass _DataSet_Coords "DataSet_Coords" (_DataSet_1D):
        _DataSet_Coords ()
        _DataSet_Coords(DataType t)
        _Frame AllocateFrame ()const 
        void SetTopology(const _Topology&)
        inline const _Topology& Top ()const 

# don't need to declare thisptr here since this class inherit from DataSet class
cdef class DataSet_Coords(DataSet_1D):
    pass

