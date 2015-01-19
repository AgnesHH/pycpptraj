import unittest
import numpy as np
from pycpptraj.base import *
from decorator import no_test
from pycpptraj.io import writetraj

farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))

class TestTrajout(unittest.TestCase):
    #@no_test
    def test_0(self):
        farray = FrameArray("data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=range(10))
        frame0 = farray[0]
        trajout = Trajout()
        #trajout.open(filename="test.x", top=farray.top, fmt="AMBERTRAJ")
        trajout.open(filename="test.x", top=farray.top, fmt="AMBERNETCDF", overwrite=True)
        #trajout.open(filename="test.pdb", top=farray.top, fmt="PDBFILE", more_args="pdb")
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
        with Trajout(filename="test_trajout_withstatement.x", top=farray.top, overwrite=True) as trajout:
            trajout.writeframe(0, frame0, farray.top)

        # reload
        assert trajout.is_open() == False
        farray2 = FrameArray("test_trajout_withstatement.x.1", "./data/Tc5b.top")
        frame0_new = farray2[0]
        print frame0_new.coords[:10]
        print frame0.coords[:10]
        print farray2.size
        
        print Trajout().formats
        
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
        writetraj("test_write_output.x", farray, farray.top, overwrite=True)
        writetraj("test_pdb_1.dummyext", farray[0], farray.top, overwrite=True, fmt='pdb')

    #@no_test
    def test_write_PDBFILE(self):
        frame0 = farray[0]
        with Trajout(filename="test_0.pdb", top=farray.top, fmt="PDBFILE", overwrite=True) as trajout:
        #with Trajout(filename="test_0.pdb", top=farray.top, fmt="PDBFILE") as trajout:
            trajout.writeframe(0, frame0, farray.top)

    #@no_test
    def test_load(self):
        farray = FrameArray("test_0.pdb", "./data/Tc5b.top")[0]
        print farray.n_atoms

if __name__ == "__main__":
    unittest.main()

