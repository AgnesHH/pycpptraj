import unittest
from pycpptraj.base import *
import pycpptraj.io as mdio

class TestPyCpptrajIO(unittest.TestCase):
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

    def test_load_and_save(self):
        traj = mdio.load(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        trajiter = mdio.iterload(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top", chunk=100)
        print trajiter

        indices = range(20, 30, 5) + [103, 78, 90, 82]
        mdio.writetraj(filename="./output/test_io_saved.x", 
                       traj=traj, 
                       top="./data/Tc5b.top",
                       fmt='AMBERTRAJ', 
                       indices=indices,
                       overwrite=True)

        # check frames
        traj = mdio.load(filename="./output/test_io_saved.x", top="./data/Tc5b.top")
        assert traj.size == len(indices) 

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

