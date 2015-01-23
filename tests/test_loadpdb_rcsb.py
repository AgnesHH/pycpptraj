import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        top = mdio.loadpdb_rcsb("1l1h")
        print top

if __name__ == "__main__":
    unittest.main()
