import unittest
import numpy as np
from pycpptraj.base import *
from decorator import no_test
from pycpptraj.misc import write_output

farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))

class TestTrajout(unittest.TestCase):
    @no_test
    def test_0(self):
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        frame0 = farray[0]
        trajout = Trajout()
        #trajout.open(fname="test.x", top=farray.top, fmt="AMBERTRAJ")
        trajout.open(fname="test.x", top=farray.top, fmt="AMBERNETCDF")
        #trajout.open(fname="test.pdb", top=farray.top, fmt="PDBFILE", more_args="pdb")
        trajout.writeframe(0, frame0, farray.top)
        assert trajout.is_open() == True

        # add more frames
        for i in range(5, 8):
            trajout.writeframe(i, farray[i], farray.top)

        assert trajout.is_open() == True
        trajout.close()

    #@no_test
    def test_with_statement(self):
        frame0 = farray[0]
        with Trajout(fname="test_trajout_withstatement.x", top=farray.top) as trajout:
            trajout.writeframe(0, frame0, farray.top)

        # reload
        assert trajout.is_open() == False
        farray2 = FrameArray("test_trajout_withstatement.x.1", "./data/Tc5b.top")
        frame0_new = farray2[0]
        print frame0_new.coords[:10]
        print frame0.coords[:10]
        np.testing.assert_almost_equal(np.array(frame0.coords), np.array(frame0_new.coords))
        print farray2.size
        
        print Trajout.formats()
        
    #@no_test
    def test_1(self):
        """test open file writen from test_0"""
        farray = FrameArray()
        farray.top = Topology('./data/Tc5b.top')
        farray.load("test.x")
        print farray.size
       
    #@no_test
    def test_2(self):
        """test write FrameArray"""
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        write_output("test_write_output.x", farray, farray.top)

    def test_write_PDBFILE(self):
        frame0 = farray[0]
        with Trajout(fname="test_0.pdb", top=farray.top, fmt="PDBFILE", more_args="pdb") as trajout:
            trajout.writeframe(0, frame0, farray.top)

if __name__ == "__main__":
    unittest.main()

