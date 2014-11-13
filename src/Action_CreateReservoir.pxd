# distutils: language = c++
from Action cimport *
from Traj_AmberNetcdf cimport *
from DataSet_integer cimport *
from DataSet_1D cimport *


cdef extern from "Action_CreateReservoir.h": 
    cdef cppclass _Action_CreateReservoir "Action_CreateReservoir":
        _Action_CreateReservoir() 
        _DispatchObject * Alloc() 
        void Help() 
