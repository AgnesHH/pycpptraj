# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.CpptrajFile cimport _CpptrajFile, CpptrajFile
from pycpptraj.AtomMask cimport _AtomMask, AtomMask
from pycpptraj.datasets.DataSet_Coords cimport _DataSet_Coords, DataSet_Coords
from pycpptraj.trajs.Trajin cimport _Trajin, Trajin
from pycpptraj.datasets.DataSet cimport _DataSet, DataSet
from pycpptraj.datasets.DataSet_1D cimport _DataSet_1D, DataSet_1D
from pycpptraj._FunctPtr cimport FunctPtr


cdef extern from "DataSet_Coords_TRJ.h": 
    cdef cppclass _DataSet_Coords_TRJ "DataSet_Coords_TRJ" (_DataSet_Coords):
        _DataSet_Coords_TRJ() 
        #~_DataSet_Coords_TRJ() 
        _DataSet * Alloc() 
        int AddSingleTrajin(const string&, _ArgList&, _Topology *)
        int AddInputTraj(_Trajin *)
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(_CpptrajFile&, size_t) const 
        void _AddFrame "AddFrame"(const _Frame& fIn)
        void SetCRD(int idx, const _Frame& fIn)
        void _GetFrame "GetFrame"(int idx, _Frame& fIn)
        void _GetFrame "GetFrame"(int idx, _Frame& fIn, const _AtomMask& mIn)


cdef class FrameArray2(DataSet_Coords):
    cdef _DataSet_Coords_TRJ* thisptr
