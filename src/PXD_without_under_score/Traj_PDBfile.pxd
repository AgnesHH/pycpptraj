# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from TrajectoryIO cimport *
from PDBfile cimport *


cdef extern from "Traj_PDBfile.h": 
    # Traj_PDBfile.h
    ctypedef enum PDBWRITEMODE "Traj_PDBfile::PDBWRITEMODE":
        NONE "Traj_PDBfile::NONE"
        SINGLE "Traj_PDBfile::SINGLE"
        MODEL "Traj_PDBfile::MODEL"
        MULTI "Traj_PDBfile::MULTI"
    cdef cppclass Traj_PDBfile "Traj_PDBfile":
        Traj_PDBfile() 
        BaseIOtype * Alloc() 
