# distutils: language = c++

"""
Re-implement Cpptraj C++ to Cython/Python style
Most of the hard word is from Daniel R. Roe
"""

#import operator *ptr and ++ptr
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as inc

#import C++ function
from libcpp.string cimport string
from libcpp.vector cimport vector
from libcpp.algorithm cimport sort as csort 
from libcpp.algorithm cimport reverse as creverse

from ArgList cimport *
from CpptrajFile cimport *
from CpptrajStdio cimport *
from ClusterList cimport *
from ClusterMatrix cimport *
from ClusterList cimport ClusterList

cdef class Cluster_DBSCAN:
    cdef:
        char UNASSIGNED
        char NOISE
        char INCLUSTER
        int minPoints_
        double epsilon_
        int kdist_
        bint sieveToCentroid_
        vector[char] Status_
        ClusterList * clusterlist_ptr

    def __cinit__(self, int minPoints_=-1, double epsilon_=-1., 
                        int kdist_=0, sieveToCentroid_=True):
        self.minPoints_ = minPoints_
        self.epsilon_ = epsilon_
        self.kdist_ = kdist_
        self.sieveToCentroid_ = sieveToCentroid_
        self.clusterlist_ptr = new ClusterList()

    def __dealloc__(self):
        del self.clusterlist_ptr

    def Help(self):
        print "\t[dbscan minpoints <n> epsilon <e> [sievetoframe] [kdist <k>]]\n"

    cdef int SetupCluster(self, ArgList& analyzeArgs):
        """Add doc here"""
        self.kdist_ = analyzeArgs.getKeyInt("kdist", 0)
        if self.kdist_ < 1:
            self.minPoints_ = analyzeArgs.getKeyInt("minpoints", -1)
            if self.minPoints_ < 1:
                print("Error: DBSCAN requires minimum # of points to be set and >= 1\n"
                          "Error: Use 'minpoints <N>'\n")
                return 1
            self.epsilon_ = analyzeArgs.getKeyDouble("epsilon", -1.0)
            if self.epsilon_ <= 0.0:
                print("Error: DBSCAN requires epsilon to be set and > 0.0\n"
                          "Error: Use 'epsilon <e>'\n")
                return 1
        #from cpptraj: sieveToCentroid_ = !analyzeArgs.hasKey("sievetoframe")
        #double-check this
        self.sieveToCentroid_ = not analyzeArgs.hasKey("sievetoframe")
        return 0

    def ClusteringInfo(self):
        """add doc here"""

    def Cluster(self):
        pass

    def AddSievedFrames(self):
        pass

    cdef ClusterResults(self, CpptrajFile& mycpptrajfile):
        pass

    cdef RegionQuery(self, vector[int]& NeighborPts, vector[int]& FramesToCluster,  
                     int point):
        """add doc here""" 

        NeighborPts.clear()
        #cdef vector[int].const_iterator otherpoint = FramesToCluster.begin()
        cdef vector[int].iterator otherpoint = FramesToCluster.begin()
        
        while otherpoint != FramesToCluster.end():
            if point == deref(otherpoint): pass
            if (self.clusterlist_ptr.FrameDistances_.GetFdist(point, deref(otherpoint)) < self.epsilon_): 
                NeighborPts.push_back(deref(otherpoint))
            inc(otherpoint)


    cdef ComputeKdist(self, int Kval, vector[int]& FramesToCluster):
        """add doc here"""
        cdef: 
            vector[double] dists, Kdist
            string outfilename = "Kdist." + str(Kval) + ".dat"
        
        dists.reverse(FramesToCluster.size())
        Kdist.reverse(FramesToCluster.size())
        mprintf("\tDBSCAN: Calculating Kdist(%i), output to %s\n", Kval, outfilename.c_str())

        #cdef vector[int].const_iterator point = FramesToCluster.begin()
        cdef vector[int].iterator point = FramesToCluster.begin()
        #cdef vector[int].const_iterator otherpoint = FramesToCluster.begin()
        cdef vector[int].iterator otherpoint = FramesToCluster.begin()

        while point != FramesToCluster.end():
            dists.clear()
            while otherpoint != FramesToCluster.end():
                dists.push_back(self.clusterlist_ptr.FrameDistances_.GetFdist(deref(point), deref(otherpoint)))
                inc(otherpoint)
            csort(dists.begin(), dists.end())
            Kdist.push_back(dists[Kval])
            inc(point)

        csort(Kdist.begin(), Kdist.end())
        creverse(Kdist.begin(), Kdist.end())

        cdef CpptrajFile Outfile
        Outfile.OpenWrite(outfilename)
        Outfile.Printf("%-8s %1i%-11s\n", "#Point", Kval,"-dist")

