import unittest
from pycpptraj.misc import iterload
from pycpptraj.base import *

# test load single frame
# TODO : got Segmentation fault (core dumped) if run this script several times
# Reason: messed up with memoryview (FIXME) (see ./LOG/log_0.txt)


class TestIterLoad(unittest.TestCase):
    def test_iterload_0(self):
        """get single frame"""
        genobj = iterload(fname="./data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"))
        
        frame0 = genobj.next()
        print frame0
        print genobj.next()
        print genobj.next()[0]
        print genobj.next().n_atoms

    def test_iterload_1(self):
        """get FrameArray"""
        print __doc__
        genobj = iterload(fname="./data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"), chunk=50)
        
        farray = genobj.next()
        frame0_0 = farray[0]
        print farray
        assert farray.size == 50
        print farray[0].n_atoms
        assert farray[0].n_atoms == 304

        print "next iteration"
        farray = genobj.next()
        frame0_1 = farray[0]
        print farray
        assert farray.size == 50
        print farray[0].n_atoms
        assert farray[0].n_atoms == 304

        print "make sure that we DID the iteration"
        assert frame0_0.coords != frame0_1.coords
        print frame0_0[:10]
        print frame0_1[:10]

    def test_iterload_2(self):
        # TODO : add more
        pass

if __name__ == "__main__":
    unittest.main()
