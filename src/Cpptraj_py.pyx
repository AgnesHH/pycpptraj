# distutils: language = c++

from libc.stdlib cimport malloc
from libcpp.vector cimport vector
from libcpp.string cimport string
from arg_wrap cimport wrap_argv
from CpptrajState cimport CpptrajState

cdef enum Mode: BATCH = 0, ERROR, QUIT, INTERACTIVE, SILENT_EXIT

cdef extern from "Cpptraj.h":
    cdef cppclass Cpptraj:
        Cpptraj()
        int RunCpptraj(int, char**)
        void Usage()
        void Intro()

        #access to private methods and attributes
        #nope.
        vector[string] Sarray
        Mode ProcessCmdLineArgs(int, char**)
        int Interactive()
        int AmbPDB(int, int, char**)
        CpptrajState State_
        string logfilename


cdef class Cpptraj_py:
    cdef Cpptraj *ptraj_ptr

    def __cinit__(self):
        self.ptraj_ptr = new Cpptraj()

    def __dealloc__(self):
        del self.ptraj_ptr

    def Usage(self):
        self.ptraj_ptr.Usage()

    def Intro(self):
        self.ptraj_ptr.Intro()

    def RunCpptraj(self, args):
        cdef char **c_argv
        #return **c_argv from "args" list
        c_argv = wrap_argv(args)
        self.ptraj_ptr.RunCpptraj(len(args),c_argv)

    def Interactive(self):
        self.ptraj_ptr.Interactive()
    
    def AmbPDB(self, id1, id2, stringlist):
        cdef char **c_argv
        c_argv =  wrap_argv(stringlist)
        return self.ptraj_ptr.AmbPDB(id1, id2, c_argv)
