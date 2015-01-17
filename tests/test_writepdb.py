import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio

class Test(unittest.TestCase):
    def test_0(self):
        # TODO : not right yet.
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        # this command actually write Amber restart file
        #mdio.writetraj("test_1.pdb", traj[0], top=traj.top, fmt='CHARMM')
        print dir(Trajout)
        print Trajout.writeframe
        with Trajout("test_1.pdb", fmt='PDBFILE') as trajout:
            trajout.writeframe(frame=traj[0], top=traj.top)

    def test_1(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        trajout = Trajout()
         
        

if __name__ == "__main__":
    unittest.main()
