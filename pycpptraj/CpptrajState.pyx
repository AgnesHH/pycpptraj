# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class CpptrajState:
    def __cinit__(self):
        self.thisptr = new _CpptrajState()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def PFL(self):
        """return TopologyList"""
        cdef TopologyList toplist = TopologyList()
        toplist.thisptr = self.thisptr.PFL()
        return toplist

    def FL(self):
        """return FrameList"""
        return deref(self.thisptr.FL())

    def DSL(self):
        """return DataSetList"""
        return deref(self.thisptr.DSL())

    def DFL(self):
        """return DataFileList"""
        return deref(self.thisptr.DFL())

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

    def AddTrajin(self,ArgList, bint):
        pass

    def AddTrajin(self, string s):
        return self.thisptr.AddTrajin(s)

    def RunAnalyses(self):
        return self.thisptr.RunAnalyses()

    def TrajinList InputTrajList(self):
        pass

    def  AddTrajout(self, ArgList):
        pass

    def AddTrajout(self, string):
        pass

    def AddReference(self,ArgList):
        pass

    def AddReference(self, string):
        pass

    def AddAction(self,DispatchObject::DispatchAllocatorType, ArgList):
        pass

    def AddAnalysis(self,DispatchObject::DispatchAllocatorType, ArgList):
        pass

    def WorldSize(self):
        pass

    def ListAll(self,ArgList):
        pass

    def SetListDebug(self,ArgList):
        pass

    def ClearList(self,ArgList):
        pass

    def RemoveDataSet(self,ArgList alist):
        return self.thisptr.RemoveDataSet(alist.thisptr[0])

    cdef TrajLength(self, string, vector[string]):
        pass

    def Run(self):
        return self.thisptr.Run()

    def MasterDataFileWrite(self):
        self.thisptr.MasterDataFileWrite()

    def WorldSize(self):
        return self.thisptr.WorldSize()

    def ListsFromArg(self, ArgList argIn, bint allowEnableAll):
        cdef vector[bint] vbint
        vbint = self.thisptr.ListsFromArg(agrIn.thisptr[0], allowEnableAll)
        return vbint
