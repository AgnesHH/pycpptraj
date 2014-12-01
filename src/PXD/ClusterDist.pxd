# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from SymmetricRmsdCalc cimport *
from DataSet_Coords cimport *
from DataSet_1D cimport *
from ClusterMatrix cimport *

# TODO: double check declaration

cdef extern from "ClusterDist.h": 
    ctypedef vector[int] Cframes
    ctypedef vector[_DataSet*] DsArray
    #ctypedef  Cframes "ClusterDist::Cframes" Cframes:
    #    pass
    cdef cppclass _Centroid "Centroid":
        pass
    cdef cppclass _Centroid_Coord "Centroid_Coord":
        _Centroid_Coord() 
        _Centroid_Coord(const _Frame& frame)
        _Centroid_Coord(int natom)
        _Centroid * Copy() 
    cdef cppclass _ClusterDist_Euclid "ClusterDist_Euclid":
        _ClusterDist_Euclid() 
        _ClusterDist_Euclid(const DsArray&)
        void PairwiseDist(_ClusterMatrix&, SievedFrames&)
        double _FrameDist(int, int)
        double _CentroidDist(_Centroid *, _Centroid *)
        double _Frame_CentroidDist(int, _Centroid *)
        void Calculate_Centroid(_Centroid *, const Cframes&)
        _Centroid * New_Centroid(const Cframes&)
        _ClusterDist * Copy() 
    cdef cppclass _Centroid_Num "Centroid_Num":
        _Centroid_Num() 
        _Centroid_Num(double val)
        _Centroid * Copy() 
    cdef cppclass _ClusterDist_SRMSD "ClusterDist_SRMSD":
        _ClusterDist_SRMSD() 
        _ClusterDist_SRMSD(_DataSet *, const _AtomMask&, bint, bint, int)
        void PairwiseDist(_ClusterMatrix&, SievedFrames&)
        double _FrameDist(int, int)
        double _CentroidDist(_Centroid *, _Centroid *)
        double _Frame_CentroidDist(int, _Centroid *)
        void Calculate_Centroid(_Centroid *, const Cframes&)
        _Centroid * New_Centroid(const Cframes&)
        _ClusterDist * Copy() 
    cdef cppclass _ClusterDist_Num "ClusterDist_Num":
        _ClusterDist_Num() 
        _ClusterDist_Num(_DataSet *)
        void PairwiseDist(_ClusterMatrix&, SievedFrames&)
        double _FrameDist(int, int)
        double _CentroidDist(_Centroid *, _Centroid *)
        double _Frame_CentroidDist(int, _Centroid *)
        void Calculate_Centroid(_Centroid *, const Cframes&)
        _Centroid * New_Centroid(const Cframes&)
        _ClusterDist * Copy() 
    cdef cppclass _ClusterDist "ClusterDist":
        pass
    cdef cppclass _ClusterDist_DME "ClusterDist_DME":
        _ClusterDist_DME()
        _ClusterDist_DME(_DataSet *, const _AtomMask&)
        void PairwiseDist(_ClusterMatrix&, SievedFrames&)
        double _FrameDist(int, int)
        double _CentroidDist(_Centroid *, _Centroid *)
        double _Frame_CentroidDist(int, _Centroid *)
        void Calculate_Centroid(_Centroid *, const Cframes&)
        _Centroid * New_Centroid(const Cframes&)
        _ClusterDist * Copy() 
    cdef cppclass _Centroid_Multi "Centroid_Multi":
        _Centroid_Multi() 
        _Centroid_Multi(const vector[double]& val)
        _Centroid * Copy() 
    cdef cppclass _ClusterDist_RMS "ClusterDist_RMS":
        _ClusterDist_RMS() 
        _ClusterDist_RMS(_DataSet *, const _AtomMask&, bint, bint)
        void PairwiseDist(_ClusterMatrix&, SievedFrames&)
        double _FrameDist(int, int)
        double _CentroidDist(_Centroid *, _Centroid *)
        double _Frame_CentroidDist(int, _Centroid *)
        void Calculate_Centroid(_Centroid *, const Cframes&)
        _Centroid * New_Centroid(const Cframes&)
        _ClusterDist * Copy() 
