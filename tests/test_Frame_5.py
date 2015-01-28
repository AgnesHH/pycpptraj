import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        indices = traj.top("@CA").selected_indices()
        frame0 = Frame(3*len(indices))

        #  TODO : what does set_coords_by_map do?
        #frame0.set_coords_by_map(traj[0], indices)
        #print frame0.size

if __name__ == "__main__":
    unittest.main()
