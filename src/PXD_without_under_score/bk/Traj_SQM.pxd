# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *


cdef extern from "Traj_SQM.h": 
    cdef cppclass Traj_SQM "Traj_SQM":
        Traj_SQM() : singleWrite_(false ), chargeIsSet_(false ), charge_(0 ), sqmParm_(0)
        BaseIOtype * Alloc() 
