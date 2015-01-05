# distutils: language = c++
import os
from Trajin cimport _Trajin
from Trajin import Trajin

cdef class Trajin_Single(Trajin):
    def __cinit__(self):
        # thisptr is from Trajin class
        # now it points to derived class
        self.baseptr0 = <_TrajectoryFile*> new _Trajin_Single()
        self.baseptr_1 = <_Trajin*> self.baseptr0
        self.thisptr = <_Trajin_Single*> self.baseptr0

    def __dealloc__(self):
        if self.thisptr:
            del self.thisptr

    # Let base-class Trajin take care those methods?
    def load(Trajin_Single self, string tnameIn, Topology tparmIn=Topology(), ArgList argIn=ArgList(), bint checkBox=True):
        """
        Load trajectory from file.

        Parameters:
        filename :: string (trajectory file's name)
        ArgList instance
        Topology instance
        chexbox :: (default = True)
        """
        # Currently we can not assigne self.top to tparmIn.copy() since Cython does not know self.top type
        # need to use self._topology since we declare it in TrajectoryFile.pxd
        if not self._topology.thisptr:
            self._topology = tparmIn.copy()
        else:
            print "Do not use input tparm, use internal top"
        if os.path.isfile(tnameIn):
            return self.thisptr.SetupTrajRead(tnameIn, argIn.thisptr[0], self._topology.thisptr, checkBox)
        else:
            raise ValueError("File does not exist")

    # do need this method here since it's alreay in base class?
    #def begin_traj(self, bint showProgress):
    #    # got "ambiguous overloaded method"
    #    #return (<_Trajin_Single*>self.thisptr).BeginTraj(showProgress)
    #    # need baseptr_1 from Trajin?
    #    return self.baseptr_1.BeginTraj(showProgress)

    # do need this method here since it's alreay in base class?
    #def end_traj(self):
    #    self.baseptr_1.EndTraj()

    # do need this method here since it's alreay in base class?
    # do need this method here since it's alreay in base class?
    #def read_traj_frame(self, int currentFrame, Frame frameIn):
    #    return self.thisptr.ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    # do need this method here since it's alreay in base class?
    #def print_info(self,int showExtended):
    #    self.baseptr_1.PrintInfo(showExtended)

    # do need this method here since it's alreay in base class?
    #def has_velocity(self):
    #    return self.baseptr_1.HasVelocity()

    # do need this method here since it's alreay in base class?
    #def nreplica_dimension(self):
    #    return self.thisptr.NreplicaDimension()

