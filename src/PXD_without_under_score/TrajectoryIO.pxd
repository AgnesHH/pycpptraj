# distutils: language = c++
from libcpp.string cimport string
from Topology cimport *
from ReplicaDimArray cimport *
from CpptrajFile cimport *
from ArgList cimport *
from BaseIOtype cimport *


cdef extern from "TrajectoryIO.h": 
    cdef cppclass TrajectoryIO "TrajectoryIO":
        TrajectoryIO() : debug_(0 ), hasV_(false ), hasT_(false)
        bint HasBox() const 
        const Box& TrajBox() const 
        bint HasV() const 
        bint HasT() const 
        const string& Title() const 
        const ReplicaDimArray& ReplicaDimensions() const 
        void SetDebug(int dIn)
        void SetBox(const Box& bIn)
        void SetVelocity(bint vIn)
        void SetTemperature(bint tIn)
        void SetTitle(const string& tIn)
        void SetReplicaDims(const ReplicaDimArray& rIn)
