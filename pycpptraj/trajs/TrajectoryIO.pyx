# distutils: language = c++


cdef class TrajectoryIO (BaseIOtype):
    def __cinit__(self):
        # _TrajectoryIO class has virtual method
        #  --> create instance of derived class and cast to _TrajectoryIO
        #self.baseptr_1 = <_TrajectoryIO*> new _TrajectoryFile()
        pass

    def __dealloc__(self):
        pass
        # __dealloc__ here?
        #if self.baseptr_1 != NULL:
        #    del self.baseptr_1

    #def virtual bint ID_TrajFormat(self,CpptrajFile):

    def total_frames(self, string fname, Topology top):
        return self.baseptr_1.setupTrajin(fname, top.thisptr)

    #def virtual int setupTrajout(self, string, Topology *, int, bint):

    #def virtual int openTrajin(self) :

    #def virtual int readFrame(self,int, Frame):

    #def virtual int readVelocity(self,int, Frame):

    #def virtual int writeFrame(self,int, Frame):

    #def virtual void closeTraj(self) :

    #def virtual void Info(self) :

    #def virtual int processWriteArgs(self,ArgList):

    #def virtual int processReadArgs(self,ArgList):

    def has_box(self):
        return self.baseptr_1.HasBox()

    def traj_box(self):
        cdef Box box = Box()
        box.thisptr[0] = self.baseptr_1.TrajBox()
        return box

    def has_velocity(self):
        return self.baseptr_1.HasV()

    def has_temperature(self):
        return self.baseptr_1.HasT()

    @property
    def title(self):
        return self.baseptr_1.Title()

    title.setter
    def title(self, string tIn):
        self.baseptr_1.SetTitle(tIn)

    def replica_dim(self):
        cdef ReplicaDimArray repdim = ReplicaDimArray()
        repdim.thisptr[0] = self.baseptr_1.ReplicaDimensions()
        return repdim

    def set_debug(self,int dIn):
        self.baseptr_1.SetDebug(dIn)

    def set_box(self, Box bIn):
        self.baseptr_1.SetBox(bIn.thisptr[0])

    def set_velocity(self,bint vIn):
        self.baseptr_1.SetVelocity(vIn)

    def set_temperature(self,bint tIn):
        self.baseptr_1.SetTemperature(tIn)

    def set_replica_dims(self, ReplicaDimArray rIn):
        self.baseptr_1.SetReplicaDims(rIn.thisptr[0])
