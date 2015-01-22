import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import _import_np

class TestHasnumpy(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]
        has_numpy, _np = _import_np()
        print has_numpy
        print _np

if __name__ == "__main__":
    unittest.main()
