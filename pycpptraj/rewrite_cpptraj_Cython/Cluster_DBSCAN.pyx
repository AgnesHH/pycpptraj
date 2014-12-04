# distutils: language = c++

"""
Re-implement Cpptraj C++ to Cython/Python style
Most of the hard word is from Daniel R. Roe
"""

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
        int minPoints
        double epsilon
        int kdist
        bint sieveToCentroid
        vector[char] Status

    def __cinit__(self, int minPoints=-1, double epsilon=-1., 
                        int kdist=0, sieveToCentroid=True):
        self.minPoints = minPoints
        self.epsilon = epsilon
        self.kdist = kdist
        self.sieveToCentroid = sieveToCentroid

    def Help(self):
        print "\t[dbscan minpoints <n> epsilon <e> [sievetoframe] [kdist <k>]]\n"

    cdef SetupCluster(self, ArgList analyzeArgs):
        """Seting up clustering 
        Parameters:
        ----------
        ArgList instance

        Output: Set values for 
        self.kdist
        self.minPoints
        self.epsilon
        self.sieveToCentroid
        """

        self.kdist = analyzeArgs.getKeyInt("kdist", 0)
        if self.kdist < 1:
            self.minPoints = analyzeArgs.getKeyInt("minpoints", -1)
            if self.minPoints < 1:
                raise ValueError("Error: DBSCAN requires minimum # of points to be set and >= 1\n"
                                 "Error: Use 'minpoints <N>'\n")
            self.epsilon = analyzeArgs.getKeyDouble("epsilon", -1.0)
            if self.epsilon <= 0.0:
                raise ValueError("Error: DBSCAN requires epsilon to be set and > 0.0\n"
                                 "Error: Use 'epsilon <e>'\n")
        self.sieveToCentroid = not analyzeArgs.hasKey("sievetoframe")

    def ClusteringInfo(self):
        """doc: Print out cluster information"""
        pass

    def Cluster(self):
        cdef:
            vector[int] NeighborPts
            vector[int] Npts2
            vector[int] FramesToCluster
            Cframes cluster_frames
            int frame
            vector[bint] Visited(FrameDistances.Nframes, False)
            ProgressBar cluster_progress

        for frame in range(FrameDistances.Nframes):
            if not FrameDistances.IgnoringRow(frame):
                FramesToCluster.push_back(frame)
        if self.kdist > 0:
            ComputeKdist(self.kdist, FramesToCluster)
        self.Status.assign(FrameDistances.Nframes, self.UNASSIGNED)
        print("Starting DBSCAN Cluster: \n")
        cluster_progress(FramesToCluster.size())
        
        for frame in FramesToCluster:
            if not Visited[frame]:
                Visited[frame] = True
                self.RegionQuery(NeighborPts, FramesToCluster, frame)
            if <int> NeighborPts.size() < self.minPoints:
                cluster_frames.clear()
                cluster_frames.push_back(frame)
            endix = NeighborPts.size()
            for idx in range(endix():
                neighbor_pt = NeighborPts[idx]
                if not Visited[neighbor_pt]:
                    Visited[neighbor_pt] = True
                    RegionQuery(Npts2, FramesToCluster, neighbor_pt)
                    if <int> Npts2.size() >= self.minPoints:
                        NeighborPts.insert(NeighborPts.end(), Npts2.begin(), Npts2.end())
                        endix = NeighborPts.size()
                        if self.Status[NeighborPts] != self.INCLUSTER:
                        cluster_frames.push_back(neighbor_pt)
                        self.Status[neighbor_pt] = self.INCLUSTER
            csort(cluster_frames.begin(), cluster_frames.end())
            cdef Cframes.iterator it = unique(cluster_frames.begin, cluster_frames.end())
            cluster_frames.resize(std_distance(cluster_frames.begin(), it))
            AddCluster(cluster_frames)
        cluster_progress.Update(iterator++)
        #to be continued

    def AddSievedFrames(self):
        pass

    cdef ClusterResults(self, CpptrajFile mycpptrajfile):
        pass

    cdef RegionQuery(self, vector[int] NeighborPts, 
                           vector[int] FramesToCluster,  
                           int pointid):
        """ 
        return all points of "point"'s neighbor (within self.epsilon)
        """ 

        NeighborPts.clear()
        cdef int frameid
        
        for frameid in FramesToCluster:
            if pointid == frameid: pass
            if (FrameDistances.GetFdist(pointid, frameid) < self.epsilon): 
                NeighborPts.push_back(frameid)

    cdef ComputeKdist(self, int Kval, vector[int] FramesToCluster):
        """add doc here"""
        cdef: 
            vector[double] dists, Kdist
            string outfilename = "Kdist." + str(Kval) + ".dat"
            vector[int].iterator point = FramesToCluster.begin()
            vector[int].iterator otherpoint = FramesToCluster.begin()
            CpptrajFile Outfile #= CpptrajFile()?
            int frame, otherframe
        
        dists.reverse(FramesToCluster.size())
        Kdist.reverse(FramesToCluster.size())
        mprintf("\tDBSCAN: Calculating Kdist(%i), output to %s\n", Kval, outfilename.c_str())

       for frame in FramesToCluster:  
            dists.clear()
            for otherframe in FramesToCluster:
                dists.push_back(FrameDistances.GetFdist(frame, otherframe))
            csort(dists.begin(), dists.end())
            Kdist.push_back(dists[Kval])

        csort(Kdist.begin(), Kdist.end())
        creverse(Kdist.begin(), Kdist.end())

        Outfile.OpenWrite(outfilename)
        Outfile.Printf("%-8s %1i%-11s\n", "#Point", Kval,"-dist")

