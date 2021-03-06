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

    def test_1(self):
        farray = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=slice(100, 500))
        farray2 = FrameArray()
        for frame in farray:
            farray2.append(frame.get_subframe("@CA", farray.top))

        print farray2.size
        # not yet implemented
        #farray2[0, 0, 0] = 100.
        farray2[0][0, 0] = 100.
        assert farray2[0, 0, 0] == 100.
        assert farray[0, 0, 0] != 100.
        print farray[0].atoms(0)

        f1sub = farray[0].get_subframe("@CA", farray.top)
        assert f1sub.n_atoms == 20
        f2sub = farray[0].strip_atoms("!@CA", top=farray.top, copy=True)

        # make sure to raise ValueError when using empty Topology
        self.assertRaises(ValueError, lambda: farray[0].strip_atoms("!@CA", copy=True))
        assert f2sub.n_atoms == f1sub.n_atoms
        assert f2sub.coords == f1sub.coords

if __name__ == "__main__":
    unittest.main()

