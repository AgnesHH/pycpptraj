import unittest
from pycpptraj.base import *

class TestTrajectory(unittest.TestCase):
    def test_1(self):
        traj = Trajectory()

        traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))

        traj.top.summary()
        assert traj.top.n_atoms == 304
        print traj.top.n_atoms

        frames = FrameArray()
        frames.get_frames(traj, update_top=True)
        print frames.size
        print frames[0].coords
        print frames[1].coords

if __name__ == "__main__":
    unittest.main()
