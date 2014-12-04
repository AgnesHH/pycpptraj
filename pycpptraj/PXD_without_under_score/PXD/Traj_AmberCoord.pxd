# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from BufferedFrame cimport *


cdef extern from "Traj_AmberCoord.h": 
    cdef cppclass Traj_AmberCoord "Traj_AmberCoord":
        Traj_AmberCoord() 
        BaseIOtype * Alloc() 
