import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

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
        print traj[:][3]
        assert traj[0, 0, 0] == -16.492

        # we don't support traj[:, idx] or traj[:, idx, idy] since this give wrong answer 
        #  got ~0.0 value 
        self.assertRaises(NotImplementedError, lambda: traj[:, 3])

if __name__ == "__main__":
    unittest.main()
