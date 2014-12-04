# distutils: language = c++
from TrajectoryIO cimport *
from Mol2File cimport *


cdef extern from "Traj_Mol2File.h": 
    cdef cppclass _Traj_Mol2File "Traj_Mol2File":
        _Traj_Mol2File() 
        _BaseIOtype * Alloc() 
