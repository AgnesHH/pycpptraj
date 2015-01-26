import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
from pycpptraj.AtomSelect import AtomSelect

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        s = AtomSelect(traj=traj, top=traj.top)

        # make sure to use `property` properly
        s.frameidx = 10
        print s.selected_frame[:1]
        assert s.frameidx == s._frameidx == 10
        s.frameidx = 100
        assert s.frameidx == s._frameidx == 100
        print s.selected_frame.coords[:10]
        print traj[100].coords[:10]
        assert_almost_equal(s.selected_frame.coords, traj[100].coords)

    def test_1(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        s = AtomSelect(traj=traj, top=traj.top)
        print s.get_indices("@CA")
        s.frameidx = 999
        print s.get_indices("@H=")

if __name__ == "__main__":
    unittest.main()
