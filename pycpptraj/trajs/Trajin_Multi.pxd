# distutils: language = c++
from Trajin cimport *
from FrameArray cimport *
from DataSet_RemLog cimport *


cdef extern from "Trajin_Multi.h": 
    # Trajin_Multi.h
    ctypedef enum TargetType "Trajin_Multi::TargetType":
        NONE "Trajin_Multi::NONE"
        TEMP "Trajin_Multi::TEMP"
        INDICES "Trajin_Multi::INDICES"
        CRDIDX "Trajin_Multi::CRDIDX"
    cdef cppclass _Trajin_Multi "Trajin_Multi":
        _Trajin_Multi() 
        #~_Trajin_Multi() 
        int SetupTrajRead(const string&, _ArgList&, _Topology *)
        int BeginTraj(bint)
        void EndTraj() 
        int ReadTrajFrame(int, _Frame&)
        void PrintInfo(int) const 
        bint HasVelocity() const 
        int Nreplica_Dimension() const 
        void EnsembleInfo() const 
        int EnsembleSetup(_FrameArray&)
        int GetNextEnsemble(_FrameArray&)
        int EnsembleSize() const 
        int EnsembleFrameNum() const 
        # we don't need MPI here
        #double MPI_AllgatherTime() const 
        #double MPI_SendRecvTime() const 
        int EnsemblePosition(int member) const 
        bint BadEnsemble() const 
        TargetType TargetMode() const 
        string FinalCrdIndices() const 

cdef class Trajin_Multi:
    cdef _Trajin_Multi* thisptr