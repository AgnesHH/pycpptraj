# distutils: language = c++
from TrajectoryFile cimport _TrajectoryFile


cdef class TrajectoryIO:
    def __cinit__(self):
        # _TrajectoryIO class has virtual method
        # --> create instance of derived class and cast to _TrajectoryIO
        self.thisptr = <_TrajectoryIO*> new _TrajectoryFile()

    def __dealloc__(self):
        if self.thisptr != NULL:
            del self.thisptr

    def HasBox(self):
        return self.thisptr.HasBox()

    def TrajBox(self):
        cdef Box box = Box()
        box.thisptr[0] = self.thisptr.TrajBox()
        return box

    def HasV(self):
        return self.thisptr.HasV()

    def HasT(self):
        return self.thisptr.HasT()

    def title(self):
        return self.thisptr.Title()

    def ReplicaDimensions(self):
        cdef ReplicaDimArray repdim = ReplicaDimArray()
        repdim.thisptr[0] = self.thisptr.ReplicaDimensions()
        return repdim

    def SetDebug(self,int dIn):
        self.thisptr.SetDebug(dIn)

    def SetBox(self, Box bIn):
        self.thisptr.SetBox(bIn.thisptr[0])

    def SetVelocity(self,bint vIn):
        self.thisptr.SetVelocity(vIn)

    def SetTemperature(self,bint tIn):
        self.thisptr.SetTemperature(tIn)

    def SetTitle(self, string tIn):
        self.thisptr.SetTitle(tIn)

    #def SetReplicaDims(self, ReplicaDimArray rIn):

