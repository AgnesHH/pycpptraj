# distutil: language = c++

ctypedef enum DistModeType: USE_FRAMES = 0, USE_FILE   
ctypedef enum DistMetricType: RMS = 0, DME, SRMSD, DATA 

cdef class ClusterList:
    def __cinit__(self):
        pass

#cdef DistModeType mt = USE_FILE
#
#print(mt)
