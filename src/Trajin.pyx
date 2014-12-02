# distutils: language = c++


cdef class Trajin:
    def __cinit__(self):
        self.thisptr = new _Trajin()

    def __dealloc__(self):
        del self.thisptr

    def CheckFrameArgs(self, ArgList argIn, int maxFrames, int starArg, int stopArg, int offsetArg):
        return self.thisptr.CheckFrameArgs(argIn.thisptr[0], maxFrames, stopArg, stopArg, offsetArg)

    def CheckFinished(self):
        return self.thisptr.CheckFinished()

    def UpdateCounters(self):
        self.thisptr.UpdateCounters()

    def GetNextFrame(self,Frame frame):
        return self.thisptr.GetNextFrame(frame.thisptr[0])

    def SetTotalFrames(self,int idx):
        self.thisptr.SetTotalFrames(idx)

    # TrajectoryIO is an abstract class. Cython does not accept virtual methods
    #def SetupTrajIO(self, string s, TrajectoryIO trajio, ArgList arglist):
    #    return self.thisptr.SetupTrajIO(s, trajio.thisptr[0], arglist.thisptr[0])

    def CheckBoxInfo(self, char* parmName, Box parmBox, Box trajBox):
        return self.thisptr.CheckBoxInfo(parmName, parmBox.thisptr[0], trajBox.thisptr[0])

    def setupFrameInfo(self):
        return self.thisptr.setupFrameInfo()

    def PrepareForRead(self,bint b):
        self.thisptr.PrepareForRead(b)

    def PrintInfoLine(self):
        self.thisptr.PrintInfoLine()

    def PrintFrameInfo(self):
        self.thisptr.PrintFrameInfo()

    @property
    def TotalFrames(self):
        return self.thisptr.TotalFrames()

    @property
    def TotalReadFrames(self):
        return self.thisptr.TotalReadFrames()

    @property
    def CurrentFrame(self):
        return self.thisptr.CurrentFrame()

    def Start(self):
        return self.thisptr.Start()

    @property
    def Offset(self):
        return self.thisptr.Offset()

    @property
    def NumFramesProcessed(self):
        return self.thisptr.NumFramesProcessed()

    def IsEnsemble(self):
        return self.thisptr.IsEnsemble()

    def SetEnsemble(self,bint b):
        self.thisptr.SetEnsemble(b)

