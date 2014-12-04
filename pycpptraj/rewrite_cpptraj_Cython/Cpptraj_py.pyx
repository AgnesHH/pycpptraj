# distutils: language = c++

from libc.stdlib cimport malloc
from libcpp.vector cimport vector
from libcpp.string cimport string
from arg_wrap cimport wrap_argv
from CpptrajState cimport CpptrajState

cdef enum Mode: BATCH = 0, ERROR, QUIT, INTERACTIVE, SILENT_EXIT

cdef class Cpptraj:
    cdef:
        vector[string] Sarray
        CpptrajState State_
        string logfilename

    def __cinit__(self):
        pass

    cdef int RunCpptraj(self, int, list):
        pass

    cdef Usage(self):
        pass

    cdef Intro(self):
        pass

    cdef Mode ProcessCmdLineArgs(self, int, char**):
        pass

    cdef int AmbPDB(self, int, int, char**):
        pass

