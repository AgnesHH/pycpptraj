# distutil: language = c++
from Action cimport *
from Action_CheckStructure cimport *
from Random cimport *
from Trajout cimport *
from DihedralSearch cimport *

cdef extern from "Action_DihedralScan.h":
    cdef cppclass _Action_DihedralScan "Action_DihedralScan":
        _Action_DihedralScan()
        _DispatchObject* Alloc()
        void Help()
