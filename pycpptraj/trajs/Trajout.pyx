# distutils: language = c++
from pycpptraj.cpptraj_dict import TrajFormatDict


cdef class Trajout:
    def __cinit__(self, *args, **kwd):
        self.thisptr = new _Trajout()

    def __init__(self, *args, **kwd):
        # need to use wit __init__ to make this works
        if args or kwd:
            print "init Trajout with *args, **kwd"
            print args, kwd
            self.open(*args, **kwd)
            print self.is_open()
            print "end itni Trajout with *args, **kwd"

    def __dealloc__(self):
        del self.thisptr

    def __enter__(self):
        return self

    def __exit__(self, arg1, arg2, arg3):
        self.close()
        
    def open(self, string fname='', Topology top=Topology(), string fmt="AMBERNETCDF", more_args=None):
        cdef ArgList arglist

        #if top.is_empty():
        #    raise ValueError("empty topology")
        print "test opening", fname, top

        if more_args:
            if isinstance(more_args, basestring):
                inputstring = more_args
                arglist = <ArgList> ArgList(inputstring) 
            elif isinstance(more_args, ArgList):
                arglist = <ArgList> more_args
            else:
                raise ValueError()
            self.thisptr.InitTrajWrite(fname, arglist.thisptr[0], top.thisptr, TrajFormatDict[fmt])
        else:
            self.thisptr.InitTrajWrite(fname, top.thisptr, TrajFormatDict[fmt])

    def close(self):
        self.thisptr.EndTraj()

    def writeframe(self, int idx, Frame frame, Topology top):
        """write trajout for Frame with given Topology
        Parameters:
        ----------
        frame : Frame instance
        top : Topology instance
        """
        self.thisptr.WriteFrame(idx, top.thisptr, frame.thisptr[0])

    def print_info(self, int idx):
        self.thisptr.PrintInfo(idx)

    def is_open(self):
        return self.thisptr.TrajIsOpen()

    def nframes_processed(self):
        return self.thisptr.NumFramesProcessed()
