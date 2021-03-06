import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
import numpy as np

class Test(unittest.TestCase):
    def test_0(self):
        # create FrameArray from Trajing_Single
        # TODO : add more assert
        traj = mdio.iterload("./data/md1_prod.Tc5b.x", "./data/Tc5b.top", chunk=100).next()
        print traj
        print traj[10][3, 0]
        print traj[10][3, 0]
        print traj[3, 3, 2]
        assert_almost_equal(traj[3, 3], traj[3][3, :])
        frame1 = traj[1]
        assert_almost_equal(frame1[0], traj[1][:, :][0])
        assert traj[0, 0, 0] == -16.492
        print traj[0][:][-1]
        print traj[0:2][0]
        print traj[:, 0, 0]
        print traj[:, 3].size
        print traj[:, :, 0][0, 0]
        assert traj[:, :, 0][0, 0] == traj[0, 0, 0]
        f0 = traj[0]
        print f0[:, :][-10]
        farr0 = traj[:2]
        #print farr0[0:1, :]
        print "XYYYYYY"
        print farr0[0:1]
      
        #self.assertRaises(NotImplementedError, lambda: traj[2:4, :, : ])
        fa = traj[2:4]
        print fa[0, :][0]
        print fa[0:2, :].__len__()
        print fa[0:1, :].__len__()
        print type(fa[0:1, :])

        print type(traj[:, :, :][0])
        print traj[:, :,  :].__len__()

        # we don't support traj[:, idx] or traj[:, idx, idy] since this give wrong answer 
        #  got ~0.0 value 
        assert_almost_equal(traj[:, 0, 0], traj[0][0])

        for i in range(traj[0].buffer3d.shape[0]):
            assert_almost_equal(traj[:, :, 0][i], traj[0].buffer3d[i])

if __name__ == "__main__":
    unittest.main()
