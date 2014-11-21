# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataSet_Coords cimport *
from Trajin cimport *


cdef extern from "DataSet_Coords_TRJ.h": 
    cdef cppclass DataSet_Coords_TRJ "DataSet_Coords_TRJ":
        DataSet_Coords_TRJ() 
        #~DataSet_Coords_TRJ() 
        DataSet * Alloc() 
        int AddSingleTrajin(const string&, ArgList&, Topology *)
        int AddInputTraj(Trajin *)
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
        void AddFrame(const Frame& fIn)
        void SetCRD(int idx, const Frame& fIn)
        void GetFrame(int idx, Frame& fIn)
        void GetFrame(int idx, Frame& fIn, const AtomMask& mIn)
