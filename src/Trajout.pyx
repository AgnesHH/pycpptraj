# distutils: language = c++


cdef class Trajout:
    def __cinit__(self):
        self.thisptr = new _Trajout()

    def __dealloc__(self):
        del self.thisptr

    def InitTrajWrite(self, string tnameIn, ArgList argIin, Topology tparmIn, TrajFormatType):
        return self.thisptr.InitTrajWrite(tnameIn, argIin.thisptr, tparmIn.thisptr, writeFormatIn)

    def InitTrajWrite(self, string tnameIn, Topology tparmIn, TrajFormatType):
        pass

    def InitStdoutTrajWrite(self,ArgList, Topology *, TrajectoryFile::TrajFormatType):
        pass

    def InitEnsembleTrajWrite(self, string, ArgList, Topology *, TrajFormatType, int):
        pass

    def InitTrajWriteWithArgs(self, string, char *, Topology *, TrajectoryFile::TrajFormatType):
        pass

    def EndTraj(self):
        self.thisptr.EndTraj()

    def WriteFrame(self,int, Topology *, Frame):
        pass

    def PrintInfo(self, int):
        pass

    def TrajIsOpen(self):
        return self.thisptr.TrajIsOpen()

    def NumFramesProcessed(self):
        return self.thisptr.NumFramesProcessed()

