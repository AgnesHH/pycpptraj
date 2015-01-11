import unittest
from pycpptraj.base import *
from decorator import no_test
from pycpptraj.misc import write_output

class TestTrajout(unittest.TestCase):
    @no_test
    def test_0(self):
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        frame0 = farray[0]
        trajout = Trajout()
        #trajout.openfile(fname="test.x", top=farray.top, fmt="AMBERTRAJ")
        #trajout.openfile(fname="test.x", top=farray.top, fmt="AMBERNETCDF")
        trajout.openfile(fname="test.pdb", top=farray.top, fmt="")
        trajout.writeframe(0, farray.top, frame0)
        #for i in range(2):
        #    trajout.writeframe(i, farray.top, frame0)
        trajout.closefile()

    @no_test
    def test_1(self):
        """test open file writen from test_0"""
        farray = FrameArray()
        farray.top = Topology('./data/Tc5b.top')
        farray.load("test.pdb")
        print farray.size
       
    def test_2(self):
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        write_output("test_write_output.x", farray, farray.top)

if __name__ == "__main__":
    unittest.main()

