# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.trajs.Trajin cimport _Trajin, Trajin
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.trajs.TrajectoryFile cimport _TrajectoryFile


# How Trajin_Single (python) class can use methods from Trajin (python) class?
cdef extern from "Trajin_Single.h": 
    cdef cppclass _Trajin_Single "Trajin_Single" (_Trajin):
    #cdef cppclass _Trajin_Single "Trajin_Single":
        _Trajin_Single() 
        #~_Trajin_Single() 
        int SetupTrajRead(const string&, _ArgList &, _Topology *, bint) except -1
        int SetupTrajRead(const string&, _ArgList &, _Topology *) 
        int BeginTraj(bint)
        void EndTraj() 
        int ReadTrajFrame(int, _Frame &)
        void PrintInfo(int)const 
        bint HasVelocity() const 
        int NreplicaDimension() const 

cdef class Trajin_Single(Trajin):
    # Inheritance
    # TrajectoryFile --> Trajin --> Trajin_Single
    cdef _Trajin_Single* thisptr
