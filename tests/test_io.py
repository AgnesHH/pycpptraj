import unittest
from pycpptraj.base import *
import pycpptraj.io as mdio

class TestPyCpptrajIO(unittest.TestCase):
    def test_save_traj_from_file(self):
        Trajout().help()
        traj = mdio.load("./data/md1_prod.Tc5b.x",
                "./data/Tc5b.top")[:5]
        print traj.size
        mdio.writetraj(filename="test_0.binpos", 
                       traj=traj, 
                       top="./data/Tc5b.top",
                       fmt="BINPOS",
                       overwrite=True)

        savedtraj = mdio.load("./test_0.binpos", traj.top)
        print "test_0.binpos size = ", savedtraj.size
        assert savedtraj.size == traj.size

    def test_blindload(self):
        top = mdio.load("./data/Tc5b.top")
        assert isinstance(top, Topology) == True

        traj = mdio.load(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")

        # TODO : add more classes here
        is_traj = (isinstance(traj, Trajin_Single) or isinstance(traj, FrameArray))
        assert is_traj == True

    def test_ParmFile(self):
        top = mdio.readparm("./data/Tc5b.top")
        mdio.writeparm("./output/test_io.top", top)
        newtop = mdio.readparm("./output/test_io.top")
        assert top.n_atoms == newtop.n_atoms

        top2 = mdio.readparm("test_0_after.pdb")
        print top2

    def test_load_and_save(self):
        print "test_load_and_save"
        traj = mdio.load(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        trajiter = mdio.iterload(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top", chunk=100)
        print trajiter

        indices = range(20, 30, 5) + [103, 78, 90, 82]
        print type(indices)
        print indices
        mdio.writetraj(filename="./output/test_io_saved_.x", 
                       traj=traj, 
                       top="./data/Tc5b.top",
                       fmt='AMBERTRAJ', 
                       indices=indices,
                       overwrite=True)

        # check frames
        traj2 = mdio.load(filename="./output/test_io_saved_.x", top="./data/Tc5b.top")
        print traj2.size
        print traj2.is_empty()
        assert traj2.size == len(indices) 

    def test_load_and_save_1(self):
        traj = mdio.load(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        trajiter = mdio.iterload(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top", chunk=100)
        print trajiter

        indices = range(20, 30, 5) + [103, 78, 90, 82]
        mdio.writetraj(filename="./output/test_io_saved.pdb", 
                       traj=traj, 
                       top="./data/Tc5b.top",
                       fmt='pdbfile', 
                       indices=indices,
                       overwrite=True)

        # check frames
        traj = mdio.load(filename="./output/test_io_saved.pdb", top="./data/Tc5b.top")
        assert traj.size == len(indices) 
        assert traj.top.n_atoms == 304

if __name__ == "__main__":
    unittest.main()

