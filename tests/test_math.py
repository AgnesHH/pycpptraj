import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
from pycpptraj.math import Matrix_3x3, Vec3

class Test(unittest.TestCase):
    def test_0(self):
        mat = Matrix_3x3(range(10, 19))
        vec = Vec3(range(3))

if __name__ == "__main__":
    unittest.main()
