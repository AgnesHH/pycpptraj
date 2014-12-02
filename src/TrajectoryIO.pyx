# distutils: language = c++


cdef class TrajectoryIO:
    def __cinit__(self):
        self.thisptr = new _TrajectoryIO()

    def __dealloc__(self):
        del self.thisptr

    #def bint HasBox(self):

    #def  Box TrajBox(self):

    #def bint HasV(self):

    #def bint HasT(self):

    #def  string Title(self):

    #def  ReplicaDimArray ReplicaDimensions(self):

    #def void SetDebug(self,int dIn):

    #def void SetBox(self, Box bIn):

    #def void SetVelocity(self,bint vIn):

    #def void SetTemperature(self,bint tIn):

    #def void SetTitle(self, string tIn):

    #def void SetReplicaDims(self, ReplicaDimArray rIn):

