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
        #virtual int setup_Trajin(const string&, _Topology *)= 0 
        #virtual int setup_Trajout(const string&, _Topology *, int, bint)= 0 
        #virtual int open_Trajin() = 0 
        #virtual int read_Frame(int, _Frame&)= 0 
        #virtual int readVelocity(int, _Frame&)= 0 
        #virtual int write_Frame(int, const _Frame&)= 0 
        #virtual void closeTraj() = 0 
        #virtual void Info() = 0 
        #virtual int processWriteArgs(_ArgList&)= 0 
        #virtual int processReadArgs(_ArgList&)= 0 
        bint Has_Box() const 
        const _Box& Traj_Box() const 
        bint HasV() const 
        bint HasT() const 
        const string& Title() const 
        const _ReplicaDimArray& Replica_Dimensions() const 
        void SetDebug(int dIn)
        void Set_Box(const _Box& bIn)
        void SetVelocity(bint vIn)
        void SetTemperature(bint tIn)
        void SetTitle(const string& tIn)
        void SetReplicaDims(const _ReplicaDimArray& rIn)


#cdef class TrajectoryIO:
#    cdef _TrajectoryIO* thisptr

