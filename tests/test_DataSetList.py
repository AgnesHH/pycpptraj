import unittest
from pycpptraj.base import *
from pycpptraj.datasets.DataSet import DataSet
from pycpptraj.DataFile import DataFile

class TestDataSetList(unittest.TestCase):
    def test_1(self):
        dlist = DataSetList()
        dumset= DataSet()
        assert len(dlist) == 0

        # make sure raising ValueError when index is out of range
        self.assertRaises(ValueError, lambda: dlist[0])

    def tearDown(self):
        dfile = DataFile()
        print dfile.dtype

if __name__ == '__main__':
    unittest.main()
