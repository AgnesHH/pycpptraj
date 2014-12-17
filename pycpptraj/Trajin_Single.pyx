# distutils: language = c++
import os
from Trajin cimport _Trajin
from Trajin import Trajin

cdef class Trajin_Single(Trajin):
    def __cinit__(self):
        # thisptr is from Trajin class
        # now it points to derived class
        self.thisptr = new _Trajin_Single()
        self.baseptr = <_Trajin*> self.thisptr

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    # Let base-class Trajin take care those methods?
    #def setup_traj_read(self, string tnameIn, ArgList argIn, Topology tparmIn, bint checkBox=True):
    #def load(self, string tnameIn, ArgList argIn, Topology tparmIn, bint checkBox=True):
    #    """
    #    Load trajectory from file.

    #    Parameters:
    #    filename :: string (trajectory file's name)
    #    ArgList instance
    #    Topology instance
    #    chexbox :: (default = True)
    #    """
    #    if os.path.isfile(tnameIn):
    #        return (<_Trajin_Single*>self.thisptr).SetupTrajRead(tnameIn, argIn.thisptr[0], tparmIn.thisptr, checkBox)
    #    else:
    #        raise ValueError("File does not exist")

    #def begin_traj(self, bint showProgress):
    #    return (<_Trajin_Single*>self.thisptr).BeginTraj(showProgress)

    #def end_traj(self):
    #    (<_Trajin_Single*>self.thisptr).EndTraj()

    #def read_traj_frame(self, int currentFrame, Frame frameIn):
    #    return (<_Trajin_Single*>self.thisptr).ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    #def print_info(self,int showExtended):
    #    (<_Trajin_Single*>self.thisptr).PrintInfo(showExtended)

    #def has_velocity(self):
    #    return (<_Trajin_Single*>self.thisptr).HasVelocity()

    #def nreplica_dimension(self):
    #    return (<_Trajin_Single*>self.thisptr).NreplicaDimension()

