# distutils: language = c++


cdef class Trajin_Single:
    def __cinit__(self):
        self.thisptr = new _Trajin_Single()

    def __dealloc__(self):
        del self.thisptr

    def SetupTrajRead(self, string tnameIn, ArgList argIn, Topology tparmIn, bint checkBox=True):
        return self.thisptr.SetupTrajRead(tnameIn, argIn.thisptr[0], tparmIn.thisptr, checkBox)

    def BeginTraj(self, bint showProgress):
        return self.thisptr.BeginTraj(showProgress)

    def EndTraj(self):
        self.thisptr.EndTraj()

    def ReadTrajFrame(self, int currentFrame, Frame frameIn):
        return self.thisptr.ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    def PrintInfo(self,int showExtended):
        self.thisptr.PrintInfo(showExtended)

    def HasVelocity(self):
        return self.thisptr.HasVelocity()

    def NreplicaDimension(self):
        return self.thisptr.NreplicaDimension()
