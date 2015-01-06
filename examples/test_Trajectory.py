import unittest
from pycpptraj.base import *
import numpy as np
from decorator import no_test

TRAJ = Trajectory()
TRAJ.top = Topology("./data/Tc5b.top")
TRAJ.load("./data/md1_prod.Tc5b.x")

class TestTrajectory(unittest.TestCase):
    def test_iter(self):
        farray = FrameArray()
        farray.top = TRAJ.top
        print "test_info"
        i = 0
        for frame in TRAJ:
            i +=1
            frame.strip_atoms(TRAJ.top.copy(), mask="!@CA")
            farray.append(frame)
        assert i == TRAJ.size == TRAJ.max_frames
        assert frame.size == TRAJ.top.n_res * 3
        farray.top.strip_atoms("!@CA")
        print "farray.top.n_atoms= ", farray.top.n_atoms
        assert farray.top.n_atoms == TRAJ.top.n_res 
        farray.top.summary()
        assert farray.size == TRAJ.max_frames
        print "rmsd to first = ", farray[0].rmsd(farray[1])
        arr = np.zeros(farray.size)
        cpptraj_rmsd = np.loadtxt("./data/rmsd_to_firstFrame_CA_allres.Tc5b.dat", skiprows=1).transpose()[1]
        print cpptraj_rmsd[:10]

        # caculate rmsd to 1st frame
        for i in range(farray.size):
            arr[i] = farray[0].rmsd(farray[i])
        print arr[:10]
        np.testing.assert_almost_equal(arr, cpptraj_rmsd, decimal=3)


    def test_trj_top(self):
        traj = Trajectory()
        #traj = Trajin_Single()
        print traj.top.is_empty()
        assert traj.top.is_empty() == True
        traj.top = Topology("./data/Tc5b.top")
        #traj.top.summary()
        assert traj.top.is_empty() == False
        traj.load("./data/md1_prod.Tc5b.x")
        #traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))
        print traj.size

    def test_1(self):
        traj = Trajectory()

        traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))

        traj.top.summary()
        assert traj.top.n_atoms == 304
        print traj.top.n_atoms

if __name__ == "__main__":
    unittest.main()
