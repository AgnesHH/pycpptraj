# distutils: language = c++
from Trajin cimport *


cdef extern from "Trajin_Single.h": 
    cdef cppclass _Trajin_Single "Trajin_Single":
        _Trajin_Single() 
        #~_Trajin_Single() 
        int SetupTrajRead(const string&, _ArgList &, _Topology *, bint)
        int SetupTrajRead(const string&, _ArgList &, _Topology *)
        int BeginTraj(bint)
        void EndTraj() 
        int ReadTraj_Frame(int, _Frame &)
        void PrintInfo(int)const 
        bint HasVelocity() const 
        int Nreplica_Dimension() const 
