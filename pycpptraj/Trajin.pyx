# distutils: language = c++
from Trajin_Single cimport _Trajin_Single


cdef class Trajin:
    def __cinit__(self):
        # since _Trajin has virtual methods, I need to cast to create _Trajin_Single instance
        # and cast to _Trajin*
        self.thisptr = <_Trajin*> new _Trajin_Single()

    def __dealloc__(self):
        if self.thisptr != NULL:
            del self.thisptr

    def CheckFrameArgs(self, ArgList argIn, int maxFrames, int starArg, int stopArg, int offsetArg):
        return self.thisptr.CheckFrameArgs(argIn.thisptr[0], maxFrames, stopArg, stopArg, offsetArg)

    def CheckFinished(self):
        return self.thisptr.CheckFinished()

    def UpdateCounters(self):
        self.thisptr.UpdateCounters()

    def GetNextFrame(self):
        cdef Frame frame = Frame()
        self.thisptr.GetNextFrame(frame.thisptr[0])
        return frame

    def SetTotalFrames(self,int idx):
        self.thisptr.SetTotalFrames(idx)

    # TrajectoryIO is an abstract class. Cython does not accept virtual methods
    def SetupTrajIO(self, string s, TrajectoryIO trajio, ArgList arglist):
        return self.thisptr.SetupTrajIO(s, trajio.thisptr[0], arglist.thisptr[0])

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

