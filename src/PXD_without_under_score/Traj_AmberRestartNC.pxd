# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from NetcdfFile cimport *


cdef extern from "Traj_AmberRestartNC.h": 
    cdef cppclass Traj_AmberRestartNC "Traj_AmberRestartNC":
        Traj_AmberRestartNC() 
        BaseIOtype * Alloc() 
        #~Traj_AmberRestartNC() 
        bint ID_TrajFormat(CpptrajFile&)
        int setupTrajin(const string&, Topology *)
        int setupTrajout(const string&, Topology *, int, bint)
        int openTrajin() 
        void closeTraj() 
        int readFrame(int, Frame&)
        int writeFrame(int, const Frame&)
        int processWriteArgs(ArgList&)
        int processReadArgs(ArgList&)
        void Info() 
