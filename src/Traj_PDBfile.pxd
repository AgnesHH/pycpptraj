# distutil: language = c++

cdef extern from "Traj_PDBfile.h":
    ctypedef enum PDBWRITEMODE "Traj_PDBfile::PDBWRITEMODE"
    cdef cppclass _Traj_PDBfile "Traj_PDBfile":
        _Traj_PDBfile()
        BaseIOtype* Alloc()

