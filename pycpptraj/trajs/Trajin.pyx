# distutils: language = c++
import os
cimport cython
from cpython.array cimport array as pyarray
from Frame cimport Frame, _Frame
from _utils cimport get_positive_idx
from FrameArray cimport FrameArray

cdef class Trajin (TrajectoryFile):

    def __cinit__(self):
        self.baseptr_1 = <_Trajin*> self.baseptr0
        self.debug = False
        pass

    def __dealloc__(self):
        pass

    def __enter__(self):
        self.begin_traj()
        return self

    def __exit__(self, arg1, arg2, arg3):
        self.end_traj()

    def __iter__(self):
        """call `with Trajin_instace` before using this iteration"""
        cdef Frame frame = Frame(self.top.n_atoms)
        cdef int i

        self.begin_traj()
        for i in range(self.baseptr_1.TotalFrames()):
            # don't use Python method to avoid overhead
            #self.get_next_frame(frame)
            self.baseptr_1.GetNextFrame(frame.thisptr[0])
            yield frame
        self.end_traj()

    @cython.boundscheck(False)
    @cython.wraparound(False)
    def __getitem__(self, idxs):
        cdef Frame frame = Frame(self.top.n_atoms)
        cdef FrameArray farray
        cdef int start, stop, step
        cdef int i
        cdef int idx_1, idx_2
        cdef list tmplist

        if not isinstance(idxs, slice):
            idx_1 = get_positive_idx(idxs, self.size)
            # raise index out of range
            if idxs != 0 and idx_1 == 0:
                raise ValueError("index is out of range")

            self.begin_traj()
            for i in range(self.baseptr_1.TotalFrames()):
                # don't use Python method to avoid overhead
                self.baseptr_1.GetNextFrame(frame.thisptr[0])
                if idx_1 == i:
                    break
            self.end_traj()
            return frame
        else:
            if self.debug:
                print idxs
            farray = FrameArray()
            farray.top = self.top
            if idxs.step == None:
                step = 1
            else:
                step = idxs.step
            if idxs.stop == None:
                stop = self.size
            else:
                stop = idxs.stop
            if idxs.start == None:
                start = 0
            else:
                start = idxs.start
            if self.debug:
                print (start, stop, step)

            with self:
                for i in range(start, stop, step):
                    self.read_traj_frame(i, frame)
                    farray.append(frame)
            return farray

    def frame_iter(self, int start, int chunk):
        """iterately get Frames with start, chunk
        Returning FrameArray instance
        """
        cdef int newstart

        newstart = start
        while newstart <= self.size-chunk:
            yield self[newstart:newstart+chunk]
            newstart += chunk

    def is_empty(self):
        return self.max_frames == 0

    def check_allocated(self):
        # decorator?
        if self.is_empty():
            raise MemoryError("not allocate pointer yet or have empty traj")

    def check_frame_args(self, ArgList argIn, int maxFrames):
        cdef int startArg, stopArg, offsetArg 
        self.check_allocated()
        startArg = stopArg = offsetArg = 0
        # static method
        self.baseptr_1.CheckFrameArgs(argIn.thisptr[0], maxFrames, startArg, stopArg, offsetArg)
        return startArg, stopArg, offsetArg

    def check_finished(self):
        self.check_allocated()
        return self.baseptr_1.CheckFinished()

    def update_counters(self):
        self.check_allocated()
        self.baseptr_1.UpdateCounters()

    def get_next_frame(self, Frame frame):
        #cdef Frame frame = Frame()
        self.baseptr_1.GetNextFrame(frame.thisptr[0])
        #return frame

    def set_max_frames(self,int idx):
        self.check_allocated()
        self.baseptr_1.SetTotalFrames(idx)

    def setup_trajio(self, string s, TrajectoryIO trajio, ArgList arglist):
        self.check_allocated()
        return self.baseptr_1.SetupTrajIO(s, trajio.baseptr_1[0], arglist.thisptr[0])

    def check_box_info(self, char* parmName, Box parmBox, Box trajBox):
        self.check_allocated()
        return self.baseptr_1.CheckBoxInfo(parmName, parmBox.thisptr[0], trajBox.thisptr[0])

    def setup_frame_info(self):
        self.check_allocated()
        return self.baseptr_1.setupFrameInfo()

    def prepare_for_read(self,bint b):
        self.check_allocated()
        self.baseptr_1.PrepareForRead(b)

    def print_info_line(self):
        self.check_allocated()
        self.baseptr_1.PrintInfoLine()

    def print_frame_info(self):
        self.check_allocated()
        self.baseptr_1.PrintFrameInfo()

    @property
    def max_frames(self):
        if self.baseptr_1:
            return self.baseptr_1.TotalFrames()
        else:
            return 0

    @property
    def size(self):
        # alias of max_frames
        return self.max_frames

    @property
    def total_read_frames(self):
        self.check_allocated()
        return self.baseptr_1.TotalReadFrames()

    @property
    def current_frame(self):
        self.check_allocated()
        return self.baseptr_1.CurrentFrame()

    def start(self):
        self.check_allocated()
        return self.baseptr_1.Start()

    @property
    def offset(self):
        self.check_allocated()
        return self.baseptr_1.Offset()

    @property
    def num_frames_processed(self):
        self.check_allocated()
        return self.baseptr_1.NumFramesProcessed()

    def is_ensemble(self):
        self.check_allocated()
        return self.baseptr_1.IsEnsemble()

    def set_ensemble(self,bint b):
        self.check_allocated()
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
        # TODO : add checking frame.n_atoms == self.top.n_atoms?
        return self.baseptr_1.ReadTrajFrame(currentFrame, frameIn.thisptr[0])

    #@abstractmethod('Trajin')
    def print_info(self,int showExtended):
        self.check_allocated()
        self.baseptr_1.PrintInfo(showExtended)

    #@abstractmethod('Trajin')
    def has_vel(self):
        self.check_allocated()
        return self.baseptr_1.HasVelocity()

    #@abstractmethod('Trajin')
    @property
    def n_repdims(self):
        self.check_allocated()
        return self.baseptr_1.NreplicaDimension()
    # end virtual methods
