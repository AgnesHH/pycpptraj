# distutil: language = c++

from TrajectoryIO cimport *
from NetcdfFile cimport *

cdef extern from "Traj_AmberNetcdf.h":
    cdef cppclass Traj_AmberNetcdf:
        Traj_AmberNetcdf()
        BaseIOtype* Alloc()
        bint ID_TrajFormat(CpptrajFile&)

