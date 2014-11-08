# distutils: language = c++

cdef class Cpptraj:
    cdef _Cpptraj  *thisptr

    def __cinit__(self):
        self.thisptr = new _Cpptraj()

    def __dealloc__(self):
        del self.thisptr

    def RunCpptraj(self, args):
        pass
        #self.thisptr.RunCpptraj()

    def RunCpptraj_2(self, args):
        cdef Mode cmode = ProcessCmdLineArgs(args)

        if cmode == BATCH:
