# distutils: language = c++
from Topology cimport *
from DataSet_1D cimport *


cdef extern from "DataSet_Coords.h": 
    cdef cppclass _DataSet_Coords "DataSet_Coords" (_DataSet_1D):
        _DataSet_Coords() 
        _DataSet_Coords(DataType)
        #virtual ~_DataSet_Coords() 
        _Frame AllocateFrame() const 
        
        # virtual methods
        void AddFrame(const _Frame&) 
        void SetCRD(int, const _Frame&) 
        void GetFrame(int, _Frame&) 
        void GetFrame(int, _Frame&, const _AtomMask&) 
        # end virtual methods

        void SetTopology(const _Topology&)
        inline const _Topology& Top() const 


cdef class DataSet_Coords (DataSet_1D):
    # DataSet_1D has baseptr
    cdef _DataSet_Coords* baseptr_2
