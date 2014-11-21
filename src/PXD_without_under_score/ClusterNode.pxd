# distutils: language = c++
from ClusterDist cimport *


cdef extern from "ClusterNode.h": 
    cdef cppclass ClusterNode "ClusterNode":
        ClusterNode() 
        #~ClusterNode() 
        ClusterNode(ClusterDist *, const Cframes&, int)
        ClusterNode(const ClusterNode&)
        #ClusterNode& operator =(const ClusterNode&)
        inline bint operator[( const ClusterNode&) const 
        inline void MergeFrames(const ClusterNode&)
        int FindCentroidFrame(const ClusterMatrix&)
        void CalcEccentricity(const ClusterMatrix&)
        void CalculateCentroid(ClusterDist * Cdist)
        double CalcAvgToCentroid(ClusterDist *)
        frame_iterator beginframe() const 
        frame_iterator endframe() const 
        int ClusterFrame(int idx) const 
        inline double AvgDist() const 
        inline double Eccentricity() const 
        inline int Num() const 
        inline int Nframes() const 
        inline int CentroidFrame() const 
        inline Centroid * Cent() 
        void SetAvgDist(double avg)
        void AddFrameToCluster(int fnum)
        void SetNum(int numIn)
        void SortFrameList() 
