# distutils: language = c++
import os
include "config.pxi"
from trajs.TrajectoryFile cimport _TrajectoryFile, TrajectoryFile

cdef class Trajin_Single(Trajin):
    def __cinit__(self, *args):
        # thisptr is from Trajin class
        # now it points to derived class
        self.baseptr0 = <_TrajectoryFile*> new _Trajin_Single()
        self.baseptr_1 = <_Trajin*> self.baseptr0
        self.thisptr = <_Trajin_Single*> self.baseptr0

    def __dealloc__(self):
        if self.thisptr:
            del self.thisptr

    # Let base-class Trajin take care those methods?
    def load(Trajin_Single self, string trajfile, Topology parm_in=Topology(), 
             ArgList arglist=ArgList(), bint check_box=True,
             ):
        """
        Load trajectory from file.

        Parameters:
        filename :: string (trajectory file's name)
        ArgList instance
        Topology instance
        chexbox :: (default = True)
        """
        # Currently we can not assigne self.top to parm_in.copy() since Cython does not know self.top type
        # need to use self._top since we declare it in TrajectoryFile.pxd
        if not parm_in.is_empty():
            print "update Topology for %s instance" % (self.__class__.__name__)
            self._top = parm_in.copy()
        return self.thisptr.SetupTrajRead(trajfile, arglist.thisptr[0], self._top.thisptr, check_box)
