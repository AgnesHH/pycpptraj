import unittest
from pycpptraj.base import *
import numpy as np
from decorator import no_test

TRAJ = Trajectory()
TRAJ.top = Topology("./data/Tc5b.top")
#TRAJ.load("./data/md1_prod.Tc5b.x", TRAJ.top, ArgList("1 100 10"))
TRAJ.load("./data/md1_prod.Tc5b.x")
print "TRAJ.size", TRAJ.size

class TestTrajectory(unittest.TestCase):

    def test_indexing_0(self):
        print "test_indexing_0"
        TRAJ2 = Trajectory()
        TRAJ2.top = Topology("./data/Tc5b.top")
        TRAJ2.load("./data/md1_prod.Tc5b.x")
        farray = FrameArray()
        farray.get_frames(TRAJ2, indices=(0, 10406, 100), update_top=True)
        assert TRAJ2[0].atom_xyz(0) == farray[0].atom_xyz(0)
        assert TRAJ2[10406].atom_xyz(0) == farray[1].atom_xyz(0)
        assert TRAJ2[100].atom_xyz(0) == farray[2].atom_xyz(0)

        # FIXME: arr = np.asarray(TRAJ2[0].buffer) does not rerturn correct view
        arr = np.asarray(TRAJ2[0].buffer)
        print "len"
        print len(arr)
        print TRAJ2[0].coords_copy()[:10]
        print "arr[:10]: ", arr[:10]
        print "test buffer view"
        frame0 = TRAJ2[0]
        arr0 = np.asarray(frame0.buffer)
        print "arr0[:10]: ", arr0[:10]
        print TRAJ2[0].coords_copy()[:10]
        print frame0.coords_copy()[:10]

        mat0 = np.asmatrix(arr0).reshape(304, 3) 
        print mat0.shape
        mat0[:, 0] = np.asmatrix(range(304)).reshape(304, 1)
        assert frame0[0] == 0.
        assert frame0[3] == 1.
        assert frame0[6] == 2.
        
    @no_test
    def test_indexing_1(self):
        print "test_indexing_1"
        TRAJ2 = Trajectory()
        TRAJ2.top = Topology("./data/Tc5b.top")
        #TRAJ2.top.strip_atoms("!@CA")
        TRAJ2.load("./data/md1_prod.Tc5b.x")
        print TRAJ2.size
        print TRAJ2.top.n_atoms
        print TRAJ2[0].coords_copy()[:10]
        print TRAJ2[100].coords_copy()[:10]
        print "out of index testing"
        self.assertRaises(ValueError, lambda: TRAJ2[10407])
        assert TRAJ2[0] != TRAJ2[100]

        print "test negative indexing"
        print TRAJ2[-1].coords_copy()[0] 
        print TRAJ2[10406].coords_copy()[0]
        assert TRAJ2[-1].coords_copy()[0] == TRAJ2[10406].coords_copy()[0]

    @no_test
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
        print "Kool, reproduce cpptraj output"

    @no_test
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

    @no_test
    def test_1(self):
        traj = Trajectory()

        traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))

        traj.top.summary()
        assert traj.top.n_atoms == 304
        print traj.top.n_atoms

if __name__ == "__main__":
    unittest.main()
