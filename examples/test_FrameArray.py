import os
import unittest
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.ArgList import ArgList
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ReferenceFrame import ReferenceFrame

ts = Trajin_Single()
datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()

top = Topology(topname)
trajin = """
"""

ts.load(mdx, top)
ts.prepare_for_read(True)
frame = Frame()
frame.set_frame_v(top, ts.has_vel(), ts.n_repdims)
frame2 = Frame(frame)

# load reference
ref = ReferenceFrame()
ref.load_ref(refname, top)
ref_frame = ref.frame

# create FrameArray to store Frame
def get_frame_array():
    farray = FrameArray()
    ts.begin_traj(False)
    for i in range(10):
        ts.get_next_frame(frame)
        farray.append(frame)
        #print frame.rmsd(ref_frame)
    ts.end_traj()
    return farray

class TestFrameArray(unittest.TestCase):
    def test_1(self):
        farray = get_frame_array()
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
        assert farray.size == 10
        assert len(farray) == farray.size
        assert farray.__len__() == farray.size

        print "test __getitem__ and __setitem__"
        print 
        frame = farray[5]
        print frame.size
        print frame.xyz(10)
        print farray[5].xyz(10)
        assert frame.xyz(10) == farray[5].xyz(10)

        print "do some calculation with 'frame', make sure this does not affect farray[5]"
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
        assert farray.size == 9

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

if __name__ == "__main__":
    unittest.main()
