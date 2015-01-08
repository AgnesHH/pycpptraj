# distutils: language = c++
from libcpp.vector cimport vector
from Frame cimport *
from Topology cimport Topology
from Trajin_Single cimport Trajin_Single
from Trajin cimport Trajin, _Trajin
from FrameArray2 cimport FrameArray2

ctypedef vector[_Frame].iterator iterator


cdef class FrameArray:
    cdef vector[_Frame] frame_v
    cdef public Topology top
