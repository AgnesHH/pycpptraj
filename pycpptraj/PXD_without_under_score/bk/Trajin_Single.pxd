# distutils: language = c++
from libcpp.string cimport string
from Trajin cimport *


cdef extern from "Trajin_Single.h": 
    cdef cppclass Trajin_Single "Trajin_Single":
        Trajin_Single() 
        #~Trajin_Single() 
        int SetupTrajRead(const string&, ArgList&, Topology *, bint)
        int SetupTrajRead(const string&, ArgList&, Topology *)
        int BeginTraj(bint)
        void EndTraj() 
        int ReadTrajFrame(int, Frame&)
        void PrintInfo(int) const 
        bint HasVelocity() const 
        int NreplicaDimension() const 
