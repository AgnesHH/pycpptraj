# distutil: language = c++

from BaseIOtype cimport *
from TrajectoryIO cimport *
from NetcdfFile cimport *

cdef extern from "Traj_AmberNetcdf.h":
    cdef cppclass _Traj_AmberNetcdf "Traj_AmberNetcdf":
        Traj_AmberNetcdf()
        _BaseIOtype* Alloc()
        bint ID_TrajFormat(_CpptrajFile&)

