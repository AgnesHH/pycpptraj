# distutils: language = c++

from libc.stdlib cimport malloc
from libcpp.vector cimport vector
from libcpp.string cimport string
from arg_wrap cimport wrap_argv
from CpptrajState cimport CpptrajState

#cdef enum Mode: BATCH = 0, ERROR, QUIT, INTERACTIVE, SILENT_EXIT

cdef extern from "Cpptraj.h":
    cdef enum Mode: BATCH = 0, ERROR, QUIT, INTERACTIVE, SILENT_EXIT
    cdef cppclass Cpptraj:
        Cpptraj()
        int RunCpptraj(int, char**)
        void Usage()
        void Intro()
        Mode ProcessCmdLineArgs(int, char**)
        int Interactive()
        int AmbPDB(int, int, char**)

