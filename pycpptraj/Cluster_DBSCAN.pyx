# distutils: language = c++


cdef class Cluster_DBSCAN:
    def __cinit__(self):
        # self.thisptr: from ClusterList
        self.thisptr = new _Cluster_DBSCAN()

    def __dealloc__(self):
        #del (<_Cluster_DBSCAN*>self.thisptr)
        del self.thisptr

    def Help(self):
        (<_Cluster_DBSCAN*>self.thisptr).Help()

    def SetupCluster(self,ArgList arglist):
        return (<_Cluster_DBSCAN*>self.thisptr).SetupCluster(arglist.thisptr[0])

    def ClusteringInfo(self):
        (<_Cluster_DBSCAN*>self.thisptr).ClusteringInfo()

    def Cluster(self):
        return (<_Cluster_DBSCAN*>self.thisptr).Cluster()

    def AddSievedFrames(self):
        (<_Cluster_DBSCAN*>self.thisptr).AddSievedFrames()

    def ClusterResults(self,CpptrajFile cpptrajfile):
        (<_Cluster_DBSCAN*>self.thisptr).ClusterResults(cpptrajfile.thisptr[0])

