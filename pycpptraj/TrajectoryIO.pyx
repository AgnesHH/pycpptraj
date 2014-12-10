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

    def has_box(self):
        return self.thisptr.HasBox()

    def traj_box(self):
        cdef Box box = Box()
        box.thisptr[0] = self.thisptr.TrajBox()
        return box

    def has_velocity(self):
        return self.thisptr.HasV()

    def has_temperature(self):
        return self.thisptr.HasT()

    @property
    def title(self):
        return self.thisptr.Title()

    title.setter
    def title(self, string tIn):
        self.thisptr.SetTitle(tIn)

    def replica_dim(self):
        cdef ReplicaDimArray repdim = ReplicaDimArray()
        repdim.thisptr[0] = self.thisptr.ReplicaDimensions()
        return repdim

    def set_debug(self,int dIn):
        self.thisptr.SetDebug(dIn)

    def set_box(self, Box bIn):
        self.thisptr.SetBox(bIn.thisptr[0])

    def set_velocity(self,bint vIn):
        self.thisptr.SetVelocity(vIn)

    def set_temperature(self,bint tIn):
        self.thisptr.SetTemperature(tIn)

    def set_replica_dims(self, ReplicaDimArray rIn):
        self.thisptr.SetReplicaDims(rIn.thisptr[0])
