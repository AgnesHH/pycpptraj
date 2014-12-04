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
        int ReadTrajFrame(int, _Frame &)
        void PrintInfo(int)const 
        bint HasVelocity() const 
        int NreplicaDimension() const 

cdef class Trajin_Single:
    cdef _Trajin_Single* thisptr
