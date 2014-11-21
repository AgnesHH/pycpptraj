# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from NetcdfFile cimport *


cdef extern from "Traj_AmberNetcdf.h": 
    cdef cppclass Traj_AmberNetcdf "Traj_AmberNetcdf":
        Traj_AmberNetcdf() 
        BaseIOtype * Alloc() 
        #~Traj_AmberNetcdf() 
        bint ID_TrajFormat(CpptrajFile&)
        int setupTrajin(const string&, Topology *)
        int setupTrajout(const string&, Topology *, int, bint)
        int openTrajin() 
        void closeTraj() 
        int readFrame(int, Frame&)
        int readVelocity(int, Frame&)
        int writeFrame(int, const Frame&)
        void Info() 
        int processWriteArgs(ArgList&)
        int processReadArgs(ArgList&)
        inline int createReservoir(bint, double, int)
        int writeReservoir(int, Frame&, double, int)
