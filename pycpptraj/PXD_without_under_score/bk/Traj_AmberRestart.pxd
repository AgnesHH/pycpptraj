# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from BufferedFrame cimport *


cdef extern from "Traj_AmberRestart.h": 
    cdef cppclass Traj_AmberRestart "Traj_AmberRestart":
        Traj_AmberRestart() 
        BaseIOtype * Alloc() 
