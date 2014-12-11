# distutils: language = c++
#from Trajin_Single cimport _Trajin_Single


cdef class Trajin:
    def __cinit__(self):
        # do not create instance for this abstract class
        pass

    def __dealloc__(self):
        # let derived class taking of free memory
        pass
        #if self.thisptr is not NULL:
        #    print "Delete %s" % self.__class__.__name__
        #    del self.thisptr

    def check_frame_args(self, ArgList argIn, int maxFrames, int starArg, int stopArg, int offsetArg):
        return self.thisptr.CheckFrameArgs(argIn.thisptr[0], maxFrames, stopArg, stopArg, offsetArg)

    def check_finished(self):
        return self.thisptr.CheckFinished()

    def update_counters(self):
        self.thisptr.UpdateCounters()

    def get_next_frame(self, Frame frame):
        #cdef Frame frame = Frame()
        self.thisptr.GetNextFrame(frame.thisptr[0])
        #return frame

    def set_total_frames(self,int idx):
        self.thisptr.SetTotalFrames(idx)

    def setup_traj_i_o(self, string s, TrajectoryIO trajio, ArgList arglist):
        return self.thisptr.SetupTrajIO(s, trajio.thisptr[0], arglist.thisptr[0])

    def check_box_info(self, char* parmName, Box parmBox, Box trajBox):
        return self.thisptr.CheckBoxInfo(parmName, parmBox.thisptr[0], trajBox.thisptr[0])

    def setup_frame_info(self):
        return self.thisptr.setupFrameInfo()

    def prepare_for_read(self,bint b):
        self.thisptr.PrepareForRead(b)

    def print_info_line(self):
        self.thisptr.PrintInfoLine()

    def print_frame_info(self):
        self.thisptr.PrintFrameInfo()

    @property
    def total_frames(self):
        return self.thisptr.TotalFrames()

    @property
    def total_read_frames(self):
        return self.thisptr.TotalReadFrames()

    @property
    def current_frame(self):
        return self.thisptr.CurrentFrame()

    def start(self):
        return self.thisptr.Start()

    @property
    def offset(self):
        return self.thisptr.Offset()

    @property
    def num_frames_processed(self):
        return self.thisptr.NumFramesProcessed()

    def is_ensemble(self):
        return self.thisptr.IsEnsemble()

    def set_ensemble(self,bint b):
        self.thisptr.SetEnsemble(b)

