# distutils: language = c++
from Topology cimport *
from DataSet_1D cimport *


cdef extern from "DataSet_Coords.h": 
    cdef cppclass DataSet_Coords "DataSet_Coords":
        DataSet_Coords() : numCrd_(0 ), numBoxCrd_(0 ), hasVel_(false)
        DataSet_Coords(DataType t): DataSet_1D(t, 8, 3 ), numCrd_(0 ), numBoxCrd_(0 ), hasVel_(false)
        Frame AllocateFrame() const 
        void SetTopology(const Topology&)
        inline const Topology& Top() const 
