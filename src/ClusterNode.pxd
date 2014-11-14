# distutils: language = c++
from ClusterDist cimport *


cdef extern from "ClusterNode.h": 
    cdef cppclass _ClusterNode "ClusterNode":
        _ClusterNode() 
        #~_ClusterNode() 
        _ClusterNode(_ClusterDist *, Cframes&, int)
        _ClusterNode(const _ClusterNode&)
        #_ClusterNode& operator =(const _ClusterNode&)
        # inline bint operator < ( const _ClusterNode&) const 
        inline void Merge_Frames(const _ClusterNode&)
        int Find_Centroid_Frame(const _ClusterMatrix&)
        void CalcEccentricity(const _ClusterMatrix&)
        void Calculate_Centroid(_ClusterDist * Cdist)
        double CalcAvgTo_Centroid(_ClusterDist *)
        #frame_iterator beginframe() const 
        #frame_iterator endframe() const 
        int Cluster_Frame(int idx) const 
        inline double AvgDist() const 
        inline double Eccentricity() const 
        inline int Num() const 
        inline int Nframes() const 
        inline int _Centroid_Frame() const 
        inline _Centroid * Cent() 
        void SetAvgDist(double avg)
        void Add_FrameToCluster(int fnum)
        void SetNum(int numIn)
        void Sort_FrameList() 
