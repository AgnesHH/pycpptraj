# distutils: language = c++


cdef class ClusterList:
    def __cinit__(self):
        # Don't create new instance for this class
        # It has virtual methods
        pass

    def __dealloc__(self):
        # Let the sub-class do its own destructor?
        #del self.thisptr
        pass

    def MetricString(self, DistMetricType dm):
        return self.thisptr.MetricString(dm)

    def Nclusters(self):
        return self.thisptr.Nclusters()

    def SetDebug(self,int debugIn):
        self.thisptr.SetDebug(debugIn)

    def Renumber(self,bint addSievedFrames):
        self.thisptr.Renumber(addSievedFrames)

    def Summary(self, string summaryfile, int maxframesIn):
        self.thisptr.Summary(summaryfile, maxframesIn)

    def Summary_Part(self, string, int, vector[int] splitFrames):
        # TODO: 
        self.thisptr.Summary_Part(summaryfile, maxframesIn, splitFrames)

    def PrintClustersToFile(self, string filename, int maxframesIn):
        self.thisptr.PrintClustersToFile(filename, maxframesIn)

    def PrintClusters(self):
        self.thisptr.PrintClusters()

    def CalcFrameDistances(self, string filename, DsArray dataSets, DistModeTypemode, DistMetricType metric, bint nofit, bint useMass, string maskexpr, int sieve, int sieveSeed):
        return self.thisptr.CalcFrameDistances(filename, dataSets, mode, metric, nofit, useMass, maskexpr, sieve, sieveSeed)

    #def  cluster_iterator begincluster(self):
    #def  cluster_iterator endcluster(self):

