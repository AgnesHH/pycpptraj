import numpy as np
import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
from pycpptraj.Matrix_3x3 import Matrix_3x3

class TestMatrix_3x3(unittest.TestCase):
    def test_0(self):
        mat = Matrix_3x3(range(9))
        print mat
        print mat.tolist()

        assert mat[:].shape == (3, 3)
        assert mat.buffer1d.shape == (9,)
        assert mat.tolist() == [float(x) for x in range(9)]

        mat[0, 0] = 100.
        assert mat.tolist()[0] == 100.

        npmat = np.asmatrix(mat[:])
        mat[0, 0] = 20.
        assert npmat[0, 0] == 20.
        print type(npmat)

if __name__ == "__main__":
    unittest.main()
