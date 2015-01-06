import unittest
from pycpptraj.base import *
from pycpptraj.DataSet import DataSet

class TestDataSetList(unittest.TestCase):
    def test_1(self):
        dlist = DataSetList()
        dumset= DataSet()
        assert len(dlist) == 0

        # make sure raising ValueError when index is out of range
        self.assertRaises(ValueError, lambda: dlist[0])

    def tearDown(self):
        print "done test"

if __name__ == '__main__':
    unittest.main()
