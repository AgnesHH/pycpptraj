# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Action_CheckStructure cimport *
from Random cimport *
from Trajout cimport *
from DihedralSearch cimport *


cdef extern from "Action_DihedralScan.h": 
    cdef cppclass _Action_DihedralScan::DihedralScanType "Action_DihedralScan::DihedralScanType" (_Action):


    cdef cppclass _Action_DihedralScan::ResidueCheckType "Action_DihedralScan::ResidueCheckType" (_Action):


    cdef cppclass _Action_DihedralScan "Action_DihedralScan" (_Action):
        _Action_DihedralScan() 
        #~_Action_DihedralScan() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_DihedralScan::DihedralScanType (Action):
    cdef _Action_DihedralScan::DihedralScanType* thisptr

cdef class Action_DihedralScan::ResidueCheckType (Action):
    cdef _Action_DihedralScan::ResidueCheckType* thisptr

cdef class Action_DihedralScan (Action):
    cdef _Action_DihedralScan* thisptr

