import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
import numpy as np

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")[:]
        arr0 = traj[:, :, :]
        print arr0.shape
        # TODO : return (n_frames, n_atoms, 3) array as a view of traj

if __name__ == "__main__":
    unittest.main()
