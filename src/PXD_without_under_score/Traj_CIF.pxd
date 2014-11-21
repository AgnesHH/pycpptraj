# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from CIFfile cimport *


cdef extern from "Traj_CIF.h": 
    cdef cppclass Traj_CIF "Traj_CIF":
        Traj_CIF() : Natoms_(0 ), Nmodels_(0 ), Cartn_x_col_(0 ), Cartn_y_col_(0 ), Cartn_z_col_(0)
        BaseIOtype * Alloc() 
