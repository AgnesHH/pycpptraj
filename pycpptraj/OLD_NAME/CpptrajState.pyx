# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class CpptrajState:
    def __cinit__(self):
        self.thisptr = new _CpptrajState()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def get_top_list(self):
        """return TopologyList"""
        cdef TopologyList toplist = TopologyList()
        toplist.thisptr = self.thisptr.PFL()
        return toplist

    def get_frame_list(self):
        """return FrameList"""
        cdef FrameList flist = FrameList()
        flist.thisptr[0] = deref(self.thisptr.FL())
        return flist

    def get_dataset_list(self):
        """return DataSetList"""
        cdef DataSetList dlist = DataSetList()
        dlist.thisptr[0] = deref(self.thisptr.DSL())
        return dlist

    def get_datafile_list(self):
        """return DataFileList"""
        cdef DataFileList dflist = DataFileList()
        dflist.thisptr[0] = deref(self.thisptr.DFL())
        return dflist

    def SetNoExitOnError(self):
        self.thisptr.SetNoExitOnError()

    def SetNoProgress(self):
        self.thisptr.SetNoProgress()

    def Debug(self):
        return self.thisptr.Debug()

    def ExitOnError(self):
        return self.thisptr.ExitOnError()

    def EmptyState(self):
        return self.thisptr.EmptyState()

    def AddTrajin(self, arg, isEnsemble=False):
        cdef string fname
        cdef ArgList argIn
        
        if isinstance(arg, ArgList):
            argIn = arg
            self.thisptr.AddTrajin(argIn.thisptr[0], isEnsemble)
        elif isinstance(arg, basestring):
            fname = arg
            self.thisptr.AddTrajin(fname)
        else:
            raise NotImplementedError()

    def RunAnalyses(self):
        return self.thisptr.RunAnalyses()

    def InputTrajList(self):
        cdef TrajinList trajlist = TrajinList()
        trajlist.thisptr[0] = self.thisptr.InputTrajList()
        return trajlist

    def AddTrajout(self, arg):
        cdef string fname
        cdef ArgList arglist

        if isinstance(arg, ArgList):
            arglist = arg
            return self.thisptr.AddTrajout(arglist.thisptr[0])
        elif isinstance(arg, basestring):
            fname = arg
            return self.thisptr.AddTrajout(fname)
        else:
            raise NotImplementedError()

    def AddReference(self, arg):
        cdef string name
        cdef ArgList arglist

        if isinstance(arg, str):
            name = arg
            self.thisptr.AddReference(name)
        elif isinstance(arg, ArgList):
            arglist = arg
            self.thisptr.AddReference(arglist.thisptr[0])
        else:
            raise NotImplementedError()

    #def AddAction(self,DispatchObject::DispatchAllocatorType, ArgList):
    #    pass

    #def AddAnalysis(self,DispatchObject::DispatchAllocatorType, ArgList):
    #    pass

    def WorldSize(self):
        return self.thisptr.WorldSize()

    def ListAll(self,ArgList arglist):
        return self.thisptr.ListAll(arglist.thisptr[0])

    def SetListDebug(self,ArgList arglist):
        return self.thisptr.SetListDebug(arglist.thisptr[0])

    def ClearList(self,ArgList arglist):
        return self.thisptr.ClearList(arglist.thisptr[0])

    def RemoveDataSet(self,ArgList alist):
        return self.thisptr.RemoveDataSet(alist.thisptr[0])

    def TrajLength(self, string topnaname, vector[string] trajlist):
        return self.thisptr.TrajLength(topnaname, trajlist)

    def Run(self):
        return self.thisptr.Run()

    def MasterDataFileWrite(self):
        self.thisptr.MasterDataFileWrite()

    def WorldSize(self):
        return self.thisptr.WorldSize()

    #def ListsFromArg(self, ArgList argIn, bint allowEnableAll):
    #    cdef vector[bint] vbint
    #    vbint = self.thisptr.ListsFromArg(agrIn.thisptr[0], allowEnableAll)
    #    return vbint
