# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from CpptrajState cimport *


cdef extern from "Cpptraj.h": 
    # Cpptraj.h
    ctypedef enum Mode "Cpptraj::Mode":
        BATCH "Cpptraj::BATCH"
        ERROR "Cpptraj::ERROR"
        QUIT "Cpptraj::QUIT"
        INTERACTIVE "Cpptraj::INTERACTIVE"
        SILENT_EXIT "Cpptraj::SILENT_EXIT"
    cdef cppclass Cpptraj "Cpptraj":
        Cpptraj() 
        int RunCpptraj(int, char * *)
        void Usage() 
        void Intro() 
        int Interactive() 
        Mode ProcessCmdLineArgs(int, char * *)
        int AmbPDB(int, int, char * *)
