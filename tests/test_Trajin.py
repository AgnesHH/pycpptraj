import unittest
from pycpptraj.base import *

class TestTrajin(unittest.TestCase):
    def test_0(self):
        TRAJ = Trajin_Single(fname="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        trajin = TRAJ.alloc()
        print trajin.top
        #print trajin.size
        #print trajin[0]
        #for frame in TRAJ:
        #    pass

if __name__ == "__main__":
    unittest.main()
