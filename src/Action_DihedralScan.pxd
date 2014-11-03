# distutil: language = c++
from Action cimport *
from Action_CheckStructure cimport *
from Random cimport *
from Trajout cimport *
from DihedralSearch cimport *

cdef extern from "Action_DihedralScan.h":
    cdef cppclass Action_DihedralScan:
        Action_DihedralScan()
        DispatchObject* Alloc()
        void Help()
