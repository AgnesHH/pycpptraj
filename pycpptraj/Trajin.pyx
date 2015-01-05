# distutils: language = c++
import os

cdef class Trajin (TrajectoryFile):

    def __cinit__(self):
        self.baseptr_1 = <_Trajin*> self.baseptr0
        pass

    def __dealloc__(self):
        pass

    def check_frame_args(self, ArgList argIn, int maxFrames):
        cdef int startArg, stopArg, offsetArg
        self.baseptr_1.CheckFrameArgs(argIn.thisptr[0], maxFrames, startArg, stopArg, offsetArg)
        return startArg, stopArg, offsetArg

    def check_finished(self):
        return self.baseptr_1.CheckFinished()

    def update_counters(self):
        self.baseptr_1.UpdateCounters()

    def get_next_frame(self, Frame frame):
        #cdef Frame frame = Frame()
        self.baseptr_1.GetNextFrame(frame.thisptr[0])
        #return frame

    def set_max_frames(self,int idx):
        self.baseptr_1.SetTotalFrames(idx)

    def setup_trajio(self, string s, TrajectoryIO trajio, ArgList arglist):
        return self.baseptr_1.SetupTrajIO(s, trajio.baseptr_1[0], arglist.thisptr[0])

    def check_box_info(self, char* parmName, Box parmBox, Box trajBox):
        return self.baseptr_1.CheckBoxInfo(parmName, parmBox.thisptr[0], trajBox.thisptr[0])

    def setup_frame_info(self):
        return self.baseptr_1.setupFrameInfo()

    def prepare_for_read(self,bint b):
        self.baseptr_1.PrepareForRead(b)

    def print_info_line(self):
        self.baseptr_1.PrintInfoLine()

    def print_frame_info(self):
        self.baseptr_1.PrintFrameInfo()

    @property
    def max_frames(self):
        return self.baseptr_1.TotalFrames()

    @property
    def total_read_frames(self):
        return self.baseptr_1.TotalReadFrames()

    @property
    def current_frame(self):
        return self.baseptr_1.CurrentFrame()

    def start(self):
        return self.baseptr_1.Start()

    @property
    def offset(self):
        return self.baseptr_1.Offset()

    @property
    def num_frames_processed(self):
        return self.baseptr_1.NumFramesProcessed()

    def is_ensemble(self):
        return self.baseptr_1.IsEnsemble()

    def set_ensemble(self,bint b):
        self.baseptr_1.SetEnsemble(b)

    # Those are virtual methods. Only implement in sub-class
    #@abstractmethod
    def load(self, string tnameIn, Topology tparmIn, ArgList argIn):
        """
        Load trajectory from file.

        Parameters:
        filename :: string (trajectory file's name)
        ArgList instance
        Topology instance
        """
        if os.path.isfile(tnameIn):
            return self.baseptr_1.SetupTrajRead(tnameIn, argIn.thisptr[0], tparmIn.thisptr)
        else:
            raise ValueError("File does not exist")

    #@abstractmethod('Trajin')
    def begin_traj(self, bint showProgress=False):
        return self.baseptr_1.BeginTraj(showProgress)

    #@abstractmethod('Trajin')
    def end_traj(self):
        self.baseptr_1.EndTraj()

    #@abstractmethod('Trajin')
    def read_traj_frame(self, int currentFrame, Frame frameIn):
        return self.baseptr_1.ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    #@abstractmethod('Trajin')
    def print_info(self,int showExtended):
        self.baseptr_1.PrintInfo(showExtended)

    #@abstractmethod('Trajin')
    def has_vel(self):
        return self.baseptr_1.HasVelocity()

    #@abstractmethod('Trajin')
    @property
    def n_repdims(self):
        return self.baseptr_1.NreplicaDimension()
    # end virtual methods
