import unittest
from pycpptraj.base import *
from decorator import no_test

class TestTrajout(unittest.TestCase):
    def test_0(self):
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        frame0 = farray[0]
        trajout = Trajout()
        trajout.openfile(fname="test.x", top=farray.top, fmt="AMBERTRAJ")
        for i in range(2):
            trajout.writeframe(i, farray.top, frame0)
        trajout.closefile()

    def test_1(self):
        """test open file writen from test_0"""
        farray = FrameArray()
        farray.top = Topology('./data/Tc5b.top')
        farray.load("test.x")
        print farray.size
        
if __name__ == "__main__":
    unittest.main()

