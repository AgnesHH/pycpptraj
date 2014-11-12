# distutils: language = c++
from TrajectoryIO cimport *


cdef extern from "Traj_Binpos.h": 
    cdef cpplass _Traj_Binpos "Traj_Binpos":
        _Traj_Binpos() 
        static _BaseIOtype * Alloc() 
        #~_Traj_Binpos() 
