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
        arr0 = traj[:, :, :]
        print arr0.shape

if __name__ == "__main__":
    unittest.main()
