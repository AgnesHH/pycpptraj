import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        print traj['coordinates'].shape 
        assert traj['coordinates'].shape == (traj.size, traj[0].n_atoms, 3)
        assert traj['topology'].n_atoms == traj.top.n_atoms

if __name__ == "__main__":
    unittest.main()
