import unittest
from pycpptraj.base import *
from decorator import no_test

class TestTrajectory(unittest.TestCase):
    def test_trj_top(self):
        traj = Trajectory()
        #traj = Trajin_Single()
        print traj.top.empty()
        assert traj.top.empty() == True
        traj.top = Topology("./data/Tc5b.top")
        #traj.top.summary()
        assert traj.top.empty() == False
        traj.load("./data/md1_prod.Tc5b.x")
        #traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))
        print traj.max_frames

    def test_1(self):
        traj = Trajectory()
        #traj.top = Topology("./data/Tc5b.top")
        #traj.top.summary()

        traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))

        traj.top.summary()
        assert traj.top.n_atoms == 304
        print traj.top.n_atoms

        frames = FrameArray()
        frames.get_frames(traj, update_top=True)
        print frames.size
        #print frames[0].coords
        #print frames[1].coords

if __name__ == "__main__":
    unittest.main()
