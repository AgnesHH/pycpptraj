import unittest
from array import array
import numpy as np
from numpy.testing import assert_almost_equal
from pycpptraj.Frame import Frame
from pycpptraj.base import *
from decorator import no_test

SMALL = 1E-6

N_ATOMS = 10
FRAME = Frame(N_ATOMS)
arr = np.arange(3 * N_ATOMS)
FRAME.set_from_crd(arr)
FRAME_orig = FRAME.copy()

class TestFrame(unittest.TestCase):
    def test_buffer(self):
        print "test_buffer"
        print FRAME.coords_copy()
        print FRAME.buffer
        FRAME.buffer[0] = 199.
        print FRAME.coords_copy()[0]
        print FRAME[0]
        FRAME[0] = 0.1
        assert FRAME[0] == FRAME.buffer[0] == FRAME.coords_copy()[0]
        assert FRAME.buffer[-1] == FRAME[-1] == 29.
        print FRAME[0:10:2] 
        arr = np.asarray(FRAME[0:10:2]) 
        print arr
        arr[0] = 100.
        print arr
        print np.asarray(FRAME[0:10:2]) 
        FRAME[0] += 1000.
        print FRAME[0]
        print "FRAME.atom_xyz(0)", FRAME.atom_xyz(0)

    def test_iter(self):
        print "test iteration"
        alist = []
        frame = FRAME_orig.copy()
        for x in frame:
            alist.append(int(x))
        print alist
        assert alist == range(3 * N_ATOMS)

        print "test enumerate"
        alist = []
        for idx, x in enumerate(frame):
            alist.append(int(x))
        assert alist == range(3 * N_ATOMS)
        print alist
        print "====================end test_iter"

    def test_indexing(self):
        # create a Frame instance with N_ATOMS atoms
        N_ATOMS = 10
        frame = Frame(N_ATOMS)
        arr = np.arange(3 * N_ATOMS)
        frame.set_from_crd(arr)
        print frame.coords_copy()

        #print "test negative indexing"
        print frame[-1]
        assert frame[-1] == 29.
        print frame[-2]
        assert frame[-2] == frame[N_ATOMS*3-2]
        assert frame[-2] == frame[N_ATOMS*3-2]
        assert frame[-2] == 28.

        frame[-1] = 100.
        assert frame[-1] == 100.
        #print frame[-1]

        #frame[-2] = 101.
        #assert frame[-2] == frame[N_ATOMS*3 - 2] == 101.

        print frame[0:10]
        frame[0] = 100.
        print frame[0]

    def test_other_stuff(self):
        print "print FRAME"
        print FRAME

    def test_long(self):
        N_ATOMS = 10
        # create frame instance with 10 atoms
        frame = Frame(N_ATOMS)
        frameref = Frame(N_ATOMS)
        
        arr = np.random.rand(N_ATOMS * 3)
        arr_reshape = arr.reshape(N_ATOMS, 3)
        frame.set_from_crd(arr, 30, 0, False)
        assert frame.n_atoms == N_ATOMS
        assert frame.size == N_ATOMS*3
        
        print frame.atom_xyz(0)
        print arr_reshape[0]
        assert_almost_equal(np.array(frame.atom_xyz(0)), arr_reshape[0])
        assert_almost_equal(frame[0], arr[0])

        # frame.info('frame info')
        frame.swap_atoms(1, 8)
        
        print "after swapping 1 - 8"

        print "update coords_copy for atom 1"
        frame.update_atom(1, array('d', [1., 1000., 3000.]))
        print frame.atom_xyz(1)
        print frame[3]
        print "assign frame[3] to 1000000."
        frame[3] = 1000000.
        print frame.atom_xyz(1)
        
        print "deviding Frame"
        frame.divide(2.)

        print "test iteration"
        count = 0
        for x in frame:
            count += 1
        print "count = %s " % count
        assert count == N_ATOMS * 3

        print "test enumeration"
        for i, x in enumerate(frame):
            if i == 10:
                frame[i] = 1010.
        print i
        assert i == N_ATOMS * 3 - 1
        assert x == frame[frame.size-1]
        assert frame[10] == 1010.

        print "set zero_coords_copy"
        frame.zero_coords()
        arr = np.asarray(frame.coords_copy())
        frame[0] = 1001.10
        assert frame[0] == frame.coords_copy()[0]
        print frame[0]
        
        arrref = np.random.rand(30)
        frameref.set_from_crd(arr, 30, 0, False)

        frame.update_atoms(array('i', [0, 3]), array('d', [0., 0., 0.1, 1.1, 2.3, 3.]))
        print type(frame.atom_xyz(0))
        print frame.atom_xyz(0)
        assert frame.atom_xyz(0) == array('d', [0., 0., 0.1])
        assert frame.atom_xyz(3) ==  array('d', [1.1, 2.3, 3.])

if __name__ == "__main__":
    unittest.main()
