# distutils: language = c++
#from Trajin_Single cimport _Trajin_Single
import os
from abc import ABCMeta, abstractmethod

cdef class Trajin:
    __metaclass__ = ABCMeta

    def __cinit__(self):
        # do not create instance for this abstract class
        pass

    def __dealloc__(self):
        # let derived class taking of free memory
        pass
        #if self.baseptr is not NULL:
        #    print "Delete %s" % self.__class__.__name__
        #    del self.baseptr

    def check_frame_args(self, ArgList argIn, int maxFrames, int starArg, int stopArg, int offsetArg):
        return self.baseptr.CheckFrameArgs(argIn.thisptr[0], maxFrames, stopArg, stopArg, offsetArg)

    def check_finished(self):
        return self.baseptr.CheckFinished()

    def update_counters(self):
        self.baseptr.UpdateCounters()

    def get_next_frame(self, Frame frame):
        #cdef Frame frame = Frame()
        self.baseptr.GetNextFrame(frame.thisptr[0])
        #return frame

    def set_total_frames(self,int idx):
        self.baseptr.SetTotalFrames(idx)

    def setup_traj_io(self, string s, TrajectoryIO trajio, ArgList arglist):
        return self.baseptr.SetupTrajIO(s, trajio.thisptr[0], arglist.thisptr[0])

    def check_box_info(self, char* parmName, Box parmBox, Box trajBox):
        return self.baseptr.CheckBoxInfo(parmName, parmBox.thisptr[0], trajBox.thisptr[0])

    def setup_frame_info(self):
        return self.baseptr.setupFrameInfo()

    def prepare_for_read(self,bint b):
        self.baseptr.PrepareForRead(b)

    def print_info_line(self):
        self.baseptr.PrintInfoLine()

    def print_frame_info(self):
        self.baseptr.PrintFrameInfo()

    @property
    def total_frames(self):
        return self.baseptr.TotalFrames()

    @property
    def total_read_frames(self):
        return self.baseptr.TotalReadFrames()

    @property
    def current_frame(self):
        return self.baseptr.CurrentFrame()

    def start(self):
        return self.baseptr.Start()

    @property
    def offset(self):
        return self.baseptr.Offset()

    @property
    def num_frames_processed(self):
        return self.baseptr.NumFramesProcessed()

    def is_ensemble(self):
        return self.baseptr.IsEnsemble()

    def set_ensemble(self,bint b):
        self.baseptr.SetEnsemble(b)

    # Those are virtual methods. Only implement in sub-class
    @abstractmethod
    def load(self, string tnameIn, ArgList argIn, Topology tparmIn):
        """
        Load trajectory from file.

        Parameters:
        filename :: string (trajectory file's name)
        ArgList instance
        Topology instance
        """
        if os.path.isfile(tnameIn):
            return self.baseptr.SetupTrajRead(tnameIn, argIn.thisptr[0], tparmIn.thisptr)
        else:
            raise ValueError("File does not exist")

    @abstractmethod('Trajin')
    def begin_traj(self, bint showProgress):
        return self.baseptr.BeginTraj(showProgress)

    @abstractmethod('Trajin')
    def end_traj(self):
        self.baseptr.EndTraj()

    @abstractmethod('Trajin')
    def read_traj_frame(self, int currentFrame, Frame frameIn):
        return self.baseptr.ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    @abstractmethod('Trajin')
    def print_info(self,int showExtended):
        self.baseptr.PrintInfo(showExtended)

    @abstractmethod('Trajin')
    def has_velocity(self):
        return self.baseptr.HasVelocity()

    @abstractmethod('Trajin')
    def nreplica_dimension(self):
        return self.baseptr.NreplicaDimension()
    # end virtual methods
