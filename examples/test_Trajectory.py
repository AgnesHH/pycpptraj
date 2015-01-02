import unittest
from pycpptraj.base import *

class TestTrajectory(unittest.TestCase):
    def test_1(self):
        traj = Trajectory()

        # TODO: if using Topology("./data/Tc5b.top"), get wrong number of atom
        # Topology ./data/Tc5b.top contains 5825287603742633651 atoms
        traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))

        #top = Topology("./data/Tc5b.top")
        #traj.load("./data/md1_prod.Tc5b.x", top)
        traj.top.summary()
        assert traj.top.n_atoms == 304
        print traj.top.n_atoms

        frames = FrameArray()
        frames.get_frames(traj, update_top=True)
        print frames.size
        print frames[0].xyz(1)
        print frames[1].xyz(1)

if __name__ == "__main__":
    unittest.main()
