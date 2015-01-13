import os
from time import time
import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.Timer import Timer
from load_traj import load
from decorator import no_test

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
FARRAY = FrameArray()
#FARRAY.get_frames(ts, update_top=True)
FRAMENUM=10000
FARRAY = ts[:FRAMENUM]

class TestFrameArray(unittest.TestCase):
    @no_test
    def test_load_CHARMM(sefl):
        datadir = os.environ['PYCPPTRAJ_HOME'] + "/tests/Cpptraj_test/Test_Charmm/"
        print "test_load_CHARMM"
        farray = FrameArray()
        farray.top = Topology(datadir + "ala3.psf")

        # got Segmentation fault for this
        # why?
        #farray.load("ala3.dcd")

        #print farray.top
        ts = Trajin_Single()
        ts.top = farray.top
        ts.load("ala3.dcd")
        print ts.size
        print ts[0]

    #@no_test
    def test_default_load(self):
        farray0 = FrameArray(fname="./data/md1_prod.Tc5b.x", top=Topology(datadir + "Tc5b.top"), indices=slice(0, 10, 2))
        print farray0
        farray1 = FrameArray(fname="./data/md1_prod.Tc5b.x", top=Topology(datadir + "Tc5b.top"), indices=range(30, 40))
        farray2 = FrameArray(fname="./data/md1_prod.Tc5b.x", top=Topology(datadir + "Tc5b.top"), indices=range(30, 40))
        farray0.join(farray1, farray2)
        print farray0

    @no_test
    def test_load_crd(self):
        print "test_load_crd"
        farray = FrameArray()
        farray.top = Topology(datadir + "Tc5b.top")
        farray.load("./data/Tc5b.nat.crd")
        print farray.size
        print farray[-1]
        print farray[0][0]
        print farray[0].coords[:10]

    @no_test
    def test_load(self):
        farray = FrameArray()
        farray.top = Topology(datadir + "Tc5b.top")
        farray.load(fname="./data/md1_prod.Tc5b.x")
        # add more frame
        farray.load(fname="./data/md1_prod.Tc5b.x", top=ts.top)
        # add slice
        farray.load(fname="./data/md1_prod.Tc5b.x", top=ts.top, indices=slice(0, ts.size, 2))
        farray.load(fname="./data/md1_prod.Tc5b.x", top=ts.top, indices=slice(0, ts.size, 2))
        farray.load(fname="./data/md1_prod.Tc5b.x", top=ts.top, indices=(1, 3, 10000, 500))

        # load list of files
        flist = ["./data/md1_prod.Tc5b.x", "./data/md1_prod.Tc5b.x"]
        farray2 = FrameArray()
        farray2.top = ts.top
        farray2.load(flist, indices=(1, 3, 10000, 500))
        print farray2

    @no_test
    def test_buffer_none(self):
        FARRAYcp = FARRAY.copy()
        print FARRAYcp[0].buffer
        arr0 = np.asarray(FARRAYcp[0].buffer)
        print arr0[:10]
        
        # what happen if we assign arr0 to `None`?
        arr0 = None
        print FARRAYcp[0].coords[:10]
        print arr0
        
    @no_test
    def test_strip_atoms(self):
        FARRAYcp = FARRAY.copy()
        arr0 = np.asarray(FARRAYcp[0].buffer)
        buff0 = FARRAYcp[0].buffer
        print arr0[:20]
        FARRAYcp.strip_atoms("!@CA")
        print FARRAYcp.top

        # memory is blown up
        print arr0[:20]

        arr1 = np.asarray(FARRAYcp[0].buffer)
        print arr1[:10]
        print FARRAYcp[0].coords[:10]
        buff1 = FARRAYcp[0].buffer
        print buff0, buff1
        print buff0[0], buff1[0]
        print FARRAYcp[0].buffer
        print FARRAYcp[0][0]

    @no_test
    def test_memoryview(self):
        print "test_memoryview"
        tmp = 100.
        FARRAYcp = FARRAY.copy()
        print FARRAYcp
        frame0 = FARRAYcp[0]
        frame0[0] = tmp 
        assert frame0[0] == tmp
        assert FARRAYcp[0][0] == tmp
        arr = np.asarray(FARRAYcp[0].buffer)
        assert arr[0] == tmp
        arr[0] = 2 * tmp
        assert frame0[0] == 2 * tmp
        assert FARRAYcp[0][0] == 2 * tmp

        # test memoryview for sub-array
        subfarray = FARRAYcp[:2]
        print "subfarray: ", subfarray
        assert subfarray[0][0] == 2 * tmp
        subfarray[0][0] = 4 * tmp
        assert subfarray[0][0] == 4 * tmp
        arr[0] = 4 * tmp
        print subfarray

        subfarray_cp = subfarray.copy()
        print "make sure we DO a copy, not a memoryview"
        subfarray_cp[0][0] = 0.1
        assert subfarray_cp[0][0] == 0.1
        assert subfarray[0][0] != 0.1
        assert arr[0] != 0.1
        assert subfarray[0][0] != 0.1

        # what's about re-assign subfarray with wrong size?
        # (subfarray used to be a view of FARRAYcp[:2])
        subfarray = FARRAYcp[50:60]
        print "test *= "
        print subfarray[0][0]
        assert subfarray.size == 10
        assert FARRAYcp.size == FRAMENUM
        print "subfarray: ", subfarray

        # doing Frame calculation
        print "test *= "
        tmp = subfarray[0][0]
        subfarray[0]*= subfarray[0]
        assert subfarray[0][0] == tmp*tmp

        #subfarray[0] /= subfarray[0]
        
    @no_test
    def test_fancy_indexing(self):
        FARRAYcp = FARRAY.copy()
        FARRAY_sub0 = FARRAYcp[:3]
        print FARRAY_sub0
        tmp = 10000. 
        FARRAY_sub0[0][100] = tmp
        assert FARRAY_sub0[0][100] == tmp
        FARRAY_sub0 = FARRAYcp[:3]
        print FARRAY_sub0
        print FARRAY_sub0[0].py_free_mem 
        print FARRAYcp[0][100]
        assert FARRAY_sub0[0].n_atoms == 304

    @no_test
    def test_joining(self):
        farray0 = FrameArray()
        farray1 = FrameArray()
        farray0.get_frames(FARRAY, (0, 2, 4, 6), update_top=True)
        farray1.get_frames(FARRAY, (1, 3, 5, 7), update_top=True)
        farray0cp = farray0.copy()
        assert farray0cp.size == farray0.size
        print "farray0cp.size", farray0cp.size

        old_size0 = farray0.size
        print farray1.size
        print "joining two arrays"
        farray0.join(farray1)
        assert farray0.size == (old_size0 + farray1.size)
        assert farray0[4].coords == farray1[0].coords

        print "farray1.size", farray1.size
        print "farray0cp.size", farray0cp.size
        farray0cp += farray1
        print farray0cp

        assert farray0cp.size == farray0.size
        for i in range(farray0.size):
            assert farray0cp[i].coords == farray0[i].coords

        farray0cp.strip_atoms("!@CA")
        print farray0cp
        print farray0cp.top

        for i in range(farray0.size):
            assert farray0cp[i].coords != farray0[i].coords

        frame0cp = farray0cp[0]
        frame0cp_1 = farray0cp[0].copy()
        frame0cp[0] = 1000.
        print farray0cp[0].coords[0]
        print frame0cp_1[0]

    @no_test
    def test_indexing_and_buffer(self):
        farray = FARRAY.copy()
        print farray.size
        print farray[0].buffer
        print farray[0].buffer
        np_arrview = np.asarray(farray[0].buffer)
        print np_arrview[:20]
        print farray[0].coords_copy()[:20]
        np.testing.assert_almost_equal(np_arrview, farray[0].coords_copy())

    @no_test
    def test_1(self):
        N = 10000
        farray = ts[:N]
        assert farray.size == N
        # store 10th atom coord of 5th frame for comparison
        # make getting results after printing 3 times
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
        print "do some calculation with 'frame', make sure this will not affect farray[5]"
        print 
        frame += frame

        print "test assignment"
        print 
        farray[5] = frame

        print "test remove Frame from farray"
        print 
        print "10th atom of farray[4 or 5 or 6] before erasing farray[5]"
        print 
        #farray.erase(5)
        del farray[5]

        print 
        print "10th atom of farray[4 or 5 or 6] after erasing farray[5]"
        print 
        assert farray.size == N - 1


        print "test FrameArray copy"
        farray_cp = farray.copy()
        del farray_cp[5]
        print farray_cp.size
        print farray.size
        assert farray_cp.size != farray.size
        #print farray[5].b_address()
        
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
        print farray_cp[0].coords_copy()

        arr = load("./data/stripAllButCA.Tc5b.x", (10, 60))
        np.testing.assert_almost_equal(arr[0], farray_cp[0].coords_copy(), decimal=3)

        print "Test printing __str__"
        print farray_cp.size
        print farray
        print farray_cp

if __name__ == "__main__":
    unittest.main()
