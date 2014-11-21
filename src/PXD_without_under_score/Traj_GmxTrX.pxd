# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *


cdef extern from "Traj_GmxTrX.h": 
    cdef cppclass Traj_GmxTrX "Traj_GmxTrX":
        Traj_GmxTrX() 
        #~Traj_GmxTrX() 
        BaseIOtype * Alloc() 
