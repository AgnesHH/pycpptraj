import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[0]

        frame0.save(filename="test_saveFrame.pdb", top=traj.top, overwrite=True)
        fnew = mdio.load("test_saveFrame.pdb", traj.top)[0]
        print frame0.coords[:20]
        print fnew.coords[:20]
        assert_almost_equal(frame0.coords, fnew.coords)

if __name__ == "__main__":
    unittest.main()
