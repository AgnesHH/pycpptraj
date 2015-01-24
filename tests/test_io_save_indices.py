import unittest
from pycpptraj.base import *
import pycpptraj.io as mdio

class TestPyCpptrajIO(unittest.TestCase):
    def test_load_and_save_0(self):
        traj = mdio.load(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")[:110]
        indices = range(20, 30, 5) + [103, 78, 90, 82]
        print indices

        #for i in indices:
        #    print traj[i]

        mdio.writetraj(filename="./output/test_io_saved_.x", 
                       traj=traj, 
                       top="./data/Tc5b.top",
                       indices=indices,
                       overwrite=True)

        # check frames
        traj2 = mdio.load(filename="./output/test_io_saved_.x", top="./data/Tc5b.top")
        # TODO : check error
        assert traj2.size == len(indices) 

if __name__ == "__main__":
    unittest.main()

