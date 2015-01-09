# distutils: language = c++
from libcpp.string cimport string
from libcpp.vector cimport vector
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.Trajin_Single cimport _Trajin_Single, Trajin_Single
from pycpptraj.trajs.Trajin cimport _Trajin, Trajin
from pycpptraj.FrameArray2 cimport FrameArray2

ctypedef vector[_Frame].iterator iterator


cdef class FrameArray:
    cdef vector[_Frame] frame_v
    cdef public Topology top
