import os
from time import time
import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.Timer import Timer
from load_traj import load

ts = Trajin_Single()
datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()
print ts.top.tag

top = Topology(topname)
trajin = """
"""

ts.load(mdx, top)
ts.prepare_for_read(True)
frame = Frame()
frame.set_frame_v(top, ts.has_vel(), ts.n_repdims)
frame2 = Frame(frame)

# create FrameArray to store Frame
def get_frame_array(N=10):
    farray = FrameArray()
    ts.begin_traj(False)
    for i in range(N):
        ts.get_next_frame(frame)
        farray.append(frame)
        #print frame.rmsd(ref_frame)
    ts.end_traj()
    farray.top = ts.top.copy()
    return farray

class TestFrameArray(unittest.TestCase):
    def test_1(self):
        N = 10000
        farray = get_frame_array(N)
        assert farray.size == N
        # store 10th atom coord of 5th frame for comparison
        # make getting results after printing 3 times
        print
        print "10th atom of farray[4]:", farray[4].xyz(10) 
        print "10th atom of farray[5]:", farray[5].xyz(10) 
        print "10th atom of farray[6]:", farray[6].xyz(10) 
        print "10th atom of farray[5]:", farray[5].xyz(10) 

        ## framearray size = 10
        print
        print "test FrameArray size"
        assert farray.size == N
        assert len(farray) == farray.size
        assert farray.__len__() == farray.size

        print "test __getitem__ and __setitem__"
        print 
        frame = farray[5]
        print frame.size
        print frame.xyz(10)
        print farray[5].xyz(10)
        assert frame.xyz(10) == farray[5].xyz(10)

        print "do some calculation with 'frame', make sure this will not affect farray[5]"
        print 
        frame += frame
        print frame.xyz(10) 
        print farray[5].xyz(10)
        assert frame.xyz(10) != farray[5].xyz(10)

        print "test assignment"
        print 
        farray[5] = frame
        print farray[5].xyz(10)
        assert frame.xyz(10) == farray[5].xyz(10)
        assert farray[5].xyz(10) == frame.xyz(10)

        print "test remove Frame from farray"
        print 
        print "10th atom of farray[4 or 5 or 6] before erasing farray[5]"
        print 
        print farray[4].xyz(10)
        print farray[5].xyz(10)
        print farray[6].xyz(10)
        #farray.erase(5)
        del farray[5]

        print 
        print "10th atom of farray[4 or 5 or 6] after erasing farray[5]"
        print 
        print farray[4].xyz(10)
        print farray[5].xyz(10)
        print farray[6].xyz(10)
        assert farray.size == N - 1

        assert farray[5].xyz(10) != frame.xyz(10)
        assert frame.xyz(10) != farray[5].xyz(10)

        print "test FrameArray copy"
        farray_cp = farray.copy()
        del farray_cp[5]
        print farray_cp.size
        print farray.size
        print farray[5].xyz(10)
        assert farray_cp.size != farray.size
        #print farray[5].b_address()
        
        print farray[5].xyz(10)
        farray[5].xyz(10)[0] = 1.0
        print farray[5].xyz(10)

        # make sure copy topology too
        assert farray_cp.top.n_atoms == farray.top.n_atoms

        print farray_cp.top.n_atoms
        print "test strip atoms"
        #t0 = time()
        t = Timer()
        t.start()
        farray_cp.strip_atoms("!@CA")
        t.stop()
        print "time for stripping atoms of %s frames is %s" % (N, t.total())
        print farray_cp.top.n_atoms
        print farray_cp[0].coords
        print farray_cp[1].coords

        arr = load("./data/stripAllButCA.Tc5b.x", (10, 60))
        np.testing.assert_almost_equal(arr[0], farray_cp[0].coords, decimal=3)

        print "Test printing __str__"
        print farray_cp.size
        print farray
        print farray_cp

if __name__ == "__main__":
    unittest.main()
