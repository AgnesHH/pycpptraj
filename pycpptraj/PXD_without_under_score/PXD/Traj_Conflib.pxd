# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *


cdef extern from "Traj_Conflib.h": 
    cdef cppclass Traj_Conflib "Traj_Conflib":
        Traj_Conflib() 
        BaseIOtype * Alloc() 
