import unittest
from array import array
from pycpptraj.base import *
from pycpptraj.misc import get_subframe
from pycpptraj import io as mdio

class TestSubFrame(unittest.TestCase):
    def test_0(self):
        farray = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=(999, 5))
        f1sub = farray[0].get_subframe("@CA", farray.top)
        assert f1sub.n_atoms == 20
        f2sub = farray[0].strip_atoms("!@CA", top=farray.top, copy=True)

        # make sure to raise ValueError when using empty Topology
        self.assertRaises(ValueError, lambda: farray[0].strip_atoms("!@CA", copy=True))
        assert f2sub.n_atoms == f1sub.n_atoms
        assert f2sub.coords == f1sub.coords

if __name__ == "__main__":
    unittest.main()

