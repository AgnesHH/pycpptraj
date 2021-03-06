import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")[:]
        traj2 = traj.get_frames(indices=(1, 3, 5, 4, 8), copy=True, update_top=True)
        print traj2
        print traj2[0, 0, :]

if __name__ == "__main__":
    unittest.main()
