# distutils: language = c++


cdef class Analysis:
    """
    Abstract Base Class
    """
    def __cinit__(self):
        pass

    def __dealloc__(self):
        pass

    def process(self ,ArgList arglist, DataSetList dslist, TopologyList toplist, DataFileList dflist, int debug):
        return self.baseptr.Setup(arglist.thisptr[0], dslist.thisptr, toplist.thisptr, dflist.thisptr, debug)

    def do_analysis(self):
        return self.baseptr.Analyze()

