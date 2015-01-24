import unittest
from array import array
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        frame0 = traj[10]
        frame = Frame()
        frame.set_frame_from_mask("@CA", traj.top)
        assert frame.size == 60
        assert frame.n_atoms == 20
        print frame.n_atoms
        print frame.size
        print frame[:].shape
        print frame[0]
        print dir(frame)
        frame.zero_coords()
        print frame[0]
        frame.add_xyz(array('d', [100, 200, 300]))
        print frame[-1]
        #print frame.t_address()

if __name__ == "__main__":
    unittest.main()
