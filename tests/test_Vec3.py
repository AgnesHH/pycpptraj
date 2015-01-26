from pycpptraj.Vec3 import Vec3
#from pycpptraj import DistRoutines as dist
import numpy as np
import unittest

class Test(unittest.TestCase):
    def test_1(self):
        # FIXME : segfault
        v1 = Vec3(0., 0., 0.)
        print v1[:]
        v1[0] = 200.
        v1[:] = [100, 300, 400]
        assert v1.tolist() == [100, 300, 400]
        assert isinstance(v1.tolist(), list) == True
        print np.asarray(v1[:])
        print v1

        from pycpptraj.math import Matrix_3x3
        mat = Matrix_3x3(range(9))
        print mat*v1

if __name__ == "__main__":
    unittest.main()
