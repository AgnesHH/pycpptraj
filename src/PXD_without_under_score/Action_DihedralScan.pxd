# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Action_CheckStructure cimport *
from Random cimport *
from Trajout cimport *
from DihedralSearch cimport *


cdef extern from "Action_DihedralScan.h": 
    cdef cppclass Action_DihedralScan::DihedralScanType "Action_DihedralScan::DihedralScanType":
    cdef cppclass Action_DihedralScan::ResidueCheckType "Action_DihedralScan::ResidueCheckType":
    cdef cppclass Action_DihedralScan "Action_DihedralScan":
        Action_DihedralScan() 
        #~Action_DihedralScan() 
        DispatchObject * Alloc() 
        void Help() 
