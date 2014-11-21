# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *


cdef extern from "Traj_CharmmDcd.h": 
    cdef cppclass Traj_CharmmDcd::union headerbyte "Traj_CharmmDcd::union headerbyte":
    cdef cppclass Traj_CharmmDcd "Traj_CharmmDcd":
        Traj_CharmmDcd() 
        BaseIOtype * Alloc() 
        #~Traj_CharmmDcd() 
