# distutils: language = c++
from libcpp.string cimport string
from libcpp.vector cimport vector
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.Trajin_Single cimport _Trajin_Single, Trajin_Single
from pycpptraj.trajs.Trajin cimport _Trajin, Trajin
from pycpptraj.cpp_algorithm cimport reverse as cpp_reverse
#from pycpptraj.FrameArray2 cimport FrameArray2

ctypedef vector[_Frame].iterator iterator


cdef class FrameArray:
    cdef vector[_Frame] frame_v
    cdef public Topology top
    cdef public Topology oldtop 

    # used for warning memory view
    cdef public bint warning 
    cdef void _join(FrameArray self, FrameArray other, mask=*)

    # create tmpfarray to hold sub FrameArray
    # traj[0:10][0] will give wrong answer
    cdef object tmpfarray

    # make public?
    # this variable is intended to let FrameArray control 
    # freeing memory for Frame instance but it's too complicated
    # 
    #cdef bint is_mem_parent
