import unittest
from pycpptraj.base import *
from pycpptraj.data_sample.load_sample_data import load_sample_data
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        traj = load_sample_data()[:]
        assert isinstance(traj, FrameArray) == True
        assert traj.top.n_atoms == 34
        assert traj.shape == (1, 34, 3)

if __name__ == "__main__":
    unittest.main()
