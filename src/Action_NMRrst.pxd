# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from BufferedLine cimport *


cdef extern from "Action_NMRrst.h": 
    cdef cppclass _Action_NMRrst::noeDataType "Action_NMRrst::noeDataType":