# distutils: language = c++
from TrajectoryIO cimport *
from BufferedFrame cimport *


cdef extern from "Traj_AmberCoord.h": 
    cdef cpplass _Traj_AmberCoord "Traj_AmberCoord":
        _Traj_AmberCoord() 
        static _BaseIOtype * Alloc() 
