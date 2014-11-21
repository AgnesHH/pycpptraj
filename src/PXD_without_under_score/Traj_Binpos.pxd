# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *


cdef extern from "Traj_Binpos.h": 
    cdef cppclass Traj_Binpos "Traj_Binpos":
        Traj_Binpos() 
        BaseIOtype * Alloc() 
        #~Traj_Binpos() 
