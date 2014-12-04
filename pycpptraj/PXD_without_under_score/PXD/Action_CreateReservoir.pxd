# distutils: language = c++
from libcpp.string cimport string
from Action cimport *
from Traj_AmberNetcdf cimport *
from DataSet_integer cimport *
from DataSet_1D cimport *


cdef extern from "Action_CreateReservoir.h": 
    cdef cppclass Action_CreateReservoir "Action_CreateReservoir":
        Action_CreateReservoir() 
        DispatchObject * Alloc() 
        void Help() 
