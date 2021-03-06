import unittest
from pycpptraj import datasets
from pycpptraj.CpptrajFile import CpptrajFile
from pycpptraj.datasets.DataSet_double import DataSet_double
import numpy as np
from array import array

class TestDataSetDB(unittest.TestCase):
    def test_0(self):
        dset0 = DataSet_double()

        # test assign to list
        tlist = [1., 2. , 3.]
        dset0.data = tlist
        assert dset0.size == len(tlist)

        # assign to new list
        tlist = [1., 2. , 3., 4.]
        dset0.data = tlist
        assert dset0.size == 4

        # assign to numpy array
        dset0.data = np.arange(1000)
        assert dset0.size == 1000
        assert dset0[999] == 999.

        # test append dset
        # reset dset0
        dset0 = DataSet_double()
        tlist = [1., 2. , 3., 4.]
        dset0.data = [1., 2. , 3., 4.]
        dset1 = DataSet_double(range(10))
        dset0.append(dset1)
        assert dset0.size == 4 + 10 

        # test adding element to 100-th position
        dset0.append(50, idx=99)
        assert dset0.size == 100
        assert dset0[99] == 50.

        # test write_buffer
        with CpptrajFile("test0.dat", 'w') as cppfile:
            print cppfile.is_open()
            for i in range(dset0.size):
                dset0.write_buffer(cppfile, i)
        #dset0.write_buffer(cppfile, 100)

if __name__ == "__main__":
    unittest.main()
