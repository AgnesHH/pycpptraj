# distutils: language = c++
from Topology cimport *
from ReplicaDimArray cimport *
from CpptrajFile cimport *
from ArgList cimport *
from BaseIOtype cimport *


cdef extern from "TrajectoryIO.h": 
    cdef cppclass _TrajectoryIO "TrajectoryIO":
        pass
        #_TrajectoryIO()
        #bint Has_Box() const 
        #const _Box & Traj_Box()const 
        #bint HasV ()const 
        #bint HasT ()const 
        #const string& Title ()const 
        #const _ReplicaDimArray& Replica_Dimensions ()const 
        #void SetDebug(int dIn)
        #void Set_Box(const _Box& bIn)
        #void SetVelocity(bint vIn)
        #void SetTemperature(bint tIn)
        #void SetTitle(const string& tIn)
        #void SetReplicaDims(const _ReplicaDimArray& rIn)
