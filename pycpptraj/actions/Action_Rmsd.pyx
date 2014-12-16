# distutils: language = c++


cdef class Action_Rmsd(Action):
    def __cinit__(self):
        self.thisptr = <_Action*> new _Action_Rmsd()

    def __dealloc__(self):
        del self.thisptr

#    def alloc(self):
#        cdef DispatchObject dp = DispatchObject()
#        dp.thisptr[0] = self.thisptr.Alloc()[0]
#
    def help(self):
        self.thisptr.Help()
