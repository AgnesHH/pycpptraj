# distutils: language = c++
from TrajectoryIO cimport *


cdef extern from "Traj_Conflib.h": 
    cdef cpplass _Traj_Conflib "Traj_Conflib":
        _Traj_Conflib() 
        static _BaseIOtype * Alloc() 
