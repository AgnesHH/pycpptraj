# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
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
    cdef cppclass Trajin_Multi "Trajin_Multi":
        Trajin_Multi() 
        #~Trajin_Multi() 
        int SetupTrajRead(const string&, ArgList&, Topology *)
        int BeginTraj(bint)
        void EndTraj() 
        int ReadTrajFrame(int, Frame&)
        void PrintInfo(int) const 
        bint HasVelocity() const 
        int NreplicaDimension() const 
        void EnsembleInfo() const 
        int EnsembleSetup(FrameArray&)
        int GetNextEnsemble(FrameArray&)
        int EnsembleSize() const 
        int EnsembleFrameNum() const 
        double MPI_AllgatherTime() const 
        double MPI_SendRecvTime() const 
        int EnsemblePosition(int member) const 
        bint BadEnsemble() const 
        TargetType TargetMode() const 
        string FinalCrdIndices() const 
