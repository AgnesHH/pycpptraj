# distutils: language = c++
from libcpp.vector cimport vector
from pycpptraj.Frame cimport *
from pycpptraj.Topology cimport Topology
from pycpptraj.Trajin_Single cimport Trajin_Single
from pycpptraj.trajs.Trajin cimport Trajin, _Trajin
from pycpptraj.FrameArray2 cimport FrameArray2

ctypedef vector[_Frame].iterator iterator


cdef class FrameArray:
    cdef vector[_Frame] frame_v
    cdef public Topology top
