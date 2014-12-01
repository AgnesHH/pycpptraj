# distutils: language = c++
from Topology cimport *
from DataSet cimport *
from DataSet_1D cimport *


cdef extern from "DataSet_Coords.h": 
    cdef cppclass _DataSet_Coords "DataSet_Coords":
        _DataSet_Coords ()
        _DataSet_Coords(DataType t)
        _Frame Allocate_Frame ()const 
        void Set_Topology(const _Topology&)
        inline const _Topology& Top ()const 
