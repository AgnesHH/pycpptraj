import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.tm_score import tm_score

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        print tm_score(traj[0], traj[1])

if __name__ == "__main__":
    unittest.main()
