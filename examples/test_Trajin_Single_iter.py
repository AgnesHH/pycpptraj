import unittest
from pycpptraj.base import *

class TestTrajingIter(unittest.TestCase):
    def test_iter_0(self):
        traj = Trajin_Single()
        traj.load(fname="data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"))
        
        for i in range(20):
            print 
            print "loop number = %s-th" % i
            for farray in traj.frame_iter(start=0, chunk=10000):
                pass
            
            print farray
            print farray[0]
            print farray[0].coords[:10]
            print farray[0].buffer
            print farray[0][0]

if __name__ == '__main__':
    unittest.main()
