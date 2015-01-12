from pycpptraj.Vec3 import Vec3
from pycpptraj import DistRoutines as dist
import numpy as np
import unittest

class Test(unittest.TestCase):
    def test_1(self):
        # FIXME : segfault
        v1 = Vec3(0., 0., 0.)

if __name__ == "__main__":
    unittest.main()
