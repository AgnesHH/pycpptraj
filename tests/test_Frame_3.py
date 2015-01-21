import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
import numpy as np
from array import array

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]
        #arr0 = np.asarray(frame0)
        print frame0[0, :]
        assert frame0.xyz3d[0, 0] == frame0[0, 0]
        assert frame0.xyz3d[0, 1] == frame0[0, 1]
        assert frame0.xyz3d[0, 2] == frame0[0, 2]
        assert frame0.xyz3d[1, 0] == frame0[1, 0]
        assert frame0.xyz3d[19, 0] == frame0[19, 0]
        frame0.xyz3d[19, 0] = 1000.

        # make sure changing xyz3d will update frame0.coords too
        assert frame0.xyz3d[19, 0] == frame0[19, 0]
        arr0 = np.asarray(frame0.xyz3d)
        print arr0.shape
        arr0[19] = [200, 300, 400.]
        assert frame0.xyz3d[19, 0] == frame0[19, 0] == arr0[19, 0]

        # try to strip atoms
        frame1 = frame0.copy()
        frame1.strip_atoms("!@CA", traj.top)
        print frame1.xyz3d.shape

        CA_2 = frame0.get_subframe("@CA", traj.top)[2, :]
        assert CA_2 == frame1[2, :] == frame1.coords[6:9]
        frame0[:] == frame0.coords
        print frame0.xyz3d[:, 2]
        print array('d', frame0.xyz3d[2:4, 0])
        print array('d', frame0.xyz3d[2:4, 1])
        #print CA_2
        assert frame0.xyz1d.shape == (912, )
        assert frame0.xyz3d.shape == (304, 3)
        assert frame0.xyz1d.is_c_contig() == True
        print array('d', frame0.xyz3d[0, :])
        frame0.xyz3d[1:3, 0] = array('d', [1., 2.])
        #assert frame0[1:3, 0] == array('d', frame0.xyz3d[1:3, 0]) 
        print array('d', frame0.xyz3d[1:3, 0])
        print frame0[1:3, 0]
        assert_almost_equal(frame0[1:3, 0], array('d', frame0.xyz3d[1:3, 0]))
        assert_almost_equal(frame0.xyz3d[1:3, 0], array('d', frame0.buffer3d[1:3, 0]))

    def test_1(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]
        print frame0[1:5, 2]
        print np.asarray(frame0.xyz3d[1:5, :])
        frame0[1:5, 2] = range(100, 104)
        frame0[0, :] = range(3)
        print frame0.xyz3d[1:5, :]
        print np.asarray(frame0[1:5, :])
        print list(frame0[1:5, :])

    def test_magic_methods(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]
        frame1 = frame0.copy()
        frame1 += frame1
        assert 2*frame0.coords[0] == frame1.coords[0]

if __name__ == "__main__":
    unittest.main()
