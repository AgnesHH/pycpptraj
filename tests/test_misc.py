import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
from pycpptraj.misc import action_dict

class TestMisc(unittest.TestCase):
    def test_0(self):
        print action_dict.keys()

if __name__ == "__main__":
    unittest.main()
