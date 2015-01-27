import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.trajs.Traj_HD5F import HD5F
from pycpptraj.utils.check_and_assert import assert_almost_equal
import numpy as np

# note : API will be changed. 
class Test(unittest.TestCase):
    def test_0(self):
        pass
        h5 = HD5F()
        h5.load("./data/ala2.h5")

    def test_1(self):
        farray = FrameArray()
        import h5py 
        fh = h5py.File("./data/ala2.h5", 'r')
        crd = fh['coordinates']
        shape = crd.shape

        farray.resize(shape[0])
        for idx, arr in enumerate(crd):
            farray[idx] = Frame(shape[1])
            farray[idx].set_from_crd(arr.flatten().astype(np.float64))

if __name__ == "__main__":
    unittest.main()
