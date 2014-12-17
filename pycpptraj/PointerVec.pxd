# distutils: language = c++

from libcpp.vector cimport vector
from Topology cimport _Topology, Topology
from Frame cimport _Frame, Frame
# Wrapper class for Vector of Topology pointers

# should we have those clasess while having TopologyList and FrameArray?
cdef class TopVec:
    cdef vector[_Topology*] ptrvec

cdef class FrameVec:
    cdef vector[_Frame*] ptrvec
