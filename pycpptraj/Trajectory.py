"""This is a thin wrapper of Trajin_Single
TODO: should combine Trajin_Single and Trajin_Multi
"""
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Frame import Frame

class Trajectory(Trajin_Single):
    def __init__(self):
        pass

    def __iter__(self):
        # TODO: should we use __iter__ here or in Trajin base class?
        """Iterately get the frame from Trajectory"""
        frame = Frame()

        frame.set_frame_v(self.top, self.has_vel(), self.n_repdims)
        self.begin_traj()
        for i in range(self.max_frames):
            self.get_next_frame(frame)
            yield frame
        self.end_traj()

