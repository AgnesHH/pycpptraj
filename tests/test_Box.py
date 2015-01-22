import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from array import array as pyarray

class TestBox(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]
        frame0.box_crd()
        print frame0.box
        frame0.boxview[:] = pyarray('d', [0.0, 1.0, 2.0, 3.0, 4.0, 6.])
        print frame0.box

        frame0.box.x = 1000.
        print frame0.box

if __name__ == "__main__":
    unittest.main()
