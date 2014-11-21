# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from SDFfile cimport *


cdef extern from "Traj_SDF.h": 
    cdef cppclass Traj_SDF "Traj_SDF":
        Traj_SDF() 
        BaseIOtype * Alloc() 
