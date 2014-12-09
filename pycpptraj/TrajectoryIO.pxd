# distutils: language = c++
from libcpp.string cimport string
from Topology cimport *
from ReplicaDimArray cimport *
from CpptrajFile cimport *
from ArgList cimport *
from BaseIOtype cimport *


cdef extern from "TrajectoryIO.h": 
    cdef cppclass _TrajectoryIO "TrajectoryIO":
        _TrajectoryIO() 
        #virtual ~_TrajectoryIO() 
        #virtual bint ID_TrajFormat(_CpptrajFile&)= 0 
        #virtual int setupTrajin(const string&, _Topology *)= 0 
        #virtual int setupTrajout(const string&, _Topology *, int, bint)= 0 
        #virtual int openTrajin() = 0 
        #virtual int readFrame(int, _Frame&)= 0 
        #virtual int readVelocity(int, _Frame&)= 0 
        #virtual int writeFrame(int, const _Frame&)= 0 
        #virtual void closeTraj() = 0 
        #virtual void Info() = 0 
        #virtual int processWriteArgs(_ArgList&)= 0 
        #virtual int processReadArgs(_ArgList&)= 0 
        bint HasBox() const 
        const _Box& TrajBox() const 
        bint HasV() const 
        bint HasT() const 
        const string& Title() const 
        const _ReplicaDimArray& Replica_Dimensions() const 
        void SetDebug(int dIn)
        void SetBox(const _Box& bIn)
        void SetVelocity(bint vIn)
        void SetTemperature(bint tIn)
        void SetTitle(const string& tIn)
        void SetReplicaDims(const _ReplicaDimArray& rIn)


cdef class TrajectoryIO:
    cdef _TrajectoryIO* thisptr

