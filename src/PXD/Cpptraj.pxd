# distutils: language = c++

from libc.stdlib cimport malloc
from libcpp.vector cimport vector
from libcpp.string cimport string
from arg_wrap cimport wrap_argv
#from CpptrajState cimport *

#cdef enum Mode: BATCH = 0, ERROR, QUIT, INTERACTIVE, SILENT_EXIT

cdef extern from "Cpptraj.h":
    ctypedef enum Mode "Cpptraj::Mode":
        BATCH "Cpptraj::BATCH"
        ERROR "Cpptraj::ERROR"
        QUIT "Cpptraj::QUIT"
        INTERACTIVE "Cpptraj::INTERACTIVE"
        SILENT_EXIT "Cpptraj::SILENT_EXIT"
    cdef cppclass _Cpptraj "Cpptraj":
        _Cpptraj()
        int RunCpptraj(int, char**)

        #Dan kep those private now
        #void Usage()
        #void Intro()
        #Mode ProcessCmdLineArgs(int, char**)
        #int Interactive()
        #int AmbPDB(int, int, char**)

