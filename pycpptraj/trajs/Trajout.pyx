# distutils: language = c++
from pycpptraj.cpptraj_dict import TrajFormatDict


cdef class Trajout:
    def __cinit__(self):
        self.thisptr = new _Trajout()

    def __dealloc__(self):
        del self.thisptr

    def openfile(self, string fname, Topology top, string ftm="AMBERNETCDF", *args):
        cdef ArgList arglist

        if args:
            if isinstance(args[0], basestring):
                inputstring = args[0]
                arglist = <ArgList> ArgList(inputstring) 
            elif isinstance(args[0], ArgList):
                arglist = <ArgList> args[0]
            else:
                raise ValueError()
            return self.thisptr.InitTrajWrite(fname, arglist.thisptr[0], top.thisptr, TrajFormatDict[ftm])
        else:
            return self.thisptr.InitTrajWrite(fname, top.thisptr, TrajFormatDict[ftm])

    #def init_stdout_traj_write(self,ArgList, Topology *, TrajFormatType):
    #    pass

    #def init_ensemble_traj_write(self, string, ArgList, Topology *, TrajFormatType, int):
    #    pass

    #def init_traj_write_with_args(self, string, char *, Topology *, fmt='unknown'):
    #    pass

    def closefile(self):
        self.thisptr.EndTraj()

    def endtraj(self):
        self.close()

    def writeframe(self, int idx, Topology top, Frame frame):
        self.thisptr.WriteFrame(idx, top.thisptr, frame.thisptr[0])

    def print_info(self, int idx):
        self.thisptr.PrintInfo(idx)

    def is_open(self):
        return self.thisptr.TrajIsOpen()

    def nframes_processed(self):
        return self.thisptr.NumFramesProcessed()
