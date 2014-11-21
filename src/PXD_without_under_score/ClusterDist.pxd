# distutils: language = c++
from libcpp.vector cimport vector
from SymmetricRmsdCalc cimport *
from DataSet_Coords cimport *
from DataSet_1D cimport *
from ClusterMatrix cimport *


cdef extern from "ClusterDist.h": 
    cdef cppclass Centroid_Coord "Centroid_Coord":
        Centroid_Coord() 
        Centroid_Coord(const Frame& frame): cframe_(frame)
        Centroid_Coord(int natom): cframe_(natom)
        Centroid * Copy() 
    cdef cppclass ClusterDist_Euclid "ClusterDist_Euclid":
        ClusterDist_Euclid() 
        ClusterDist_Euclid(const DsArray&)
        void PairwiseDist(ClusterMatrix&, const SievedFrames&)
        double FrameDist(int, int)
        double CentroidDist(Centroid *, Centroid *)
        double FrameCentroidDist(int, Centroid *)
        void CalculateCentroid(Centroid *, const Cframes&)
        Centroid * NewCentroid(const Cframes&)
        ClusterDist * Copy() 
    cdef cppclass Centroid_Num "Centroid_Num":
        Centroid_Num() : cval_(0.0)
        Centroid_Num(double val): cval_(val)
        Centroid * Copy() 
    cdef cppclass ClusterDist_SRMSD "ClusterDist_SRMSD":
        ClusterDist_SRMSD() 
        ClusterDist_SRMSD(DataSet *, const AtomMask&, bint, bint, int)
        void PairwiseDist(ClusterMatrix&, const SievedFrames&)
        double FrameDist(int, int)
        double CentroidDist(Centroid *, Centroid *)
        double FrameCentroidDist(int, Centroid *)
        void CalculateCentroid(Centroid *, const Cframes&)
        Centroid * NewCentroid(const Cframes&)
        ClusterDist * Copy() 
    cdef cppclass Centroid "Centroid":
    cdef cppclass ClusterDist_Num "ClusterDist_Num":
        ClusterDist_Num() : data_(0 ), dcalc_(0)
        ClusterDist_Num(DataSet *)
        void PairwiseDist(ClusterMatrix&, const SievedFrames&)
        double FrameDist(int, int)
        double CentroidDist(Centroid *, Centroid *)
        double FrameCentroidDist(int, Centroid *)
        void CalculateCentroid(Centroid *, const Cframes&)
        Centroid * NewCentroid(const Cframes&)
        ClusterDist * Copy() 
    cdef cppclass ClusterDist "ClusterDist":
    cdef cppclass ClusterDist_DME "ClusterDist_DME":
        ClusterDist_DME() : coords_(0)
        ClusterDist_DME(DataSet *, const AtomMask&)
        void PairwiseDist(ClusterMatrix&, const SievedFrames&)
        double FrameDist(int, int)
        double CentroidDist(Centroid *, Centroid *)
        double FrameCentroidDist(int, Centroid *)
        void CalculateCentroid(Centroid *, const Cframes&)
        Centroid * NewCentroid(const Cframes&)
        ClusterDist * Copy() 
    cdef cppclass Centroid_Multi "Centroid_Multi":
        Centroid_Multi() 
        Centroid_Multi(const vector[double]& val): cvals_(val)
        Centroid * Copy() 
    cdef cppclass ClusterDist_RMS "ClusterDist_RMS":
        ClusterDist_RMS() : coords_(0 ), nofit_(false ), useMass_(false)
        ClusterDist_RMS(DataSet *, const AtomMask&, bint, bint)
        void PairwiseDist(ClusterMatrix&, const SievedFrames&)
        double FrameDist(int, int)
        double CentroidDist(Centroid *, Centroid *)
        double FrameCentroidDist(int, Centroid *)
        void CalculateCentroid(Centroid *, const Cframes&)
        Centroid * NewCentroid(const Cframes&)
        ClusterDist * Copy() 
