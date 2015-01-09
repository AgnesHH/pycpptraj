# distutils: language = c++
from trajs.TrajectoryIO cimport *
from BufferedFrame cimport *


cdef extern from "Traj_AmberCoord.h": 
    cdef cppclass _Traj_AmberCoord "Traj_AmberCoord" (_TrajectoryIO):
        _Traj_AmberCoord() 
        _BaseIOtype * Alloc() 
        void WriteHelp()

cdef class Traj_AmberCoord (TrajectoryIO):
    cdef _Traj_AmberCoord* thisptr
