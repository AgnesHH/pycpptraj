import unittest
from pycpptraj.base import *
from pycpptraj.datasets.DataSet_Coords_CRD import DataSet_Coords_CRD as Trajectory

class Test(unittest.TestCase):
    def test_0(self):
        TRAJ = Trajin_Single(fname="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        print TRAJ.size
        print TRAJ[:100:10]
        print TRAJ[20:100:10]
        traj = Trajectory()
        traj.top = TRAJ.top.copy()
        traj.addframe(TRAJ[0])
        print traj[0]
        
if __name__ == "__main__":
    unittest.main()

