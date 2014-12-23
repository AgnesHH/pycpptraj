# distutils: language = c++
from libcpp.vector cimport vector
from Frame cimport *

ctypedef vector[_Frame*].iterator iterator


cdef class FrameArray:
    cdef vector[_Frame*] frame_v
