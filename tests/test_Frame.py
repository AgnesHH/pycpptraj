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
    def test_create_frame(self):
        # test creating Frame from a list!
        frame = Frame(range(300))
        assert frame.size == 300
        assert frame.n_atoms == 100
        assert frame.coords == array('d', [x for x in range(300)])
        assert frame[:] == frame.coords

        frame[:] = array('d', range(300, 0, -1))
        assert frame[:] == array('d', range(300, 0, -1))
        assert frame.coords == array('d', range(300, 0, -1))

        frame[:] = np.arange(300, dtype='d')
        assert frame.coords == array('d', [x for x in range(300)])
        assert frame[:] == frame.coords
  
    def test_buffer(self):
        print "+++++start test_buffer+++++++"
        print FRAME.coords
        print FRAME.buffer

        FRAME.buffer[0] = 199.
        print FRAME.coords[0]
        print FRAME[0]
        assert FRAME[0] == FRAME.buffer[0] == FRAME.coords[0]

        FRAME[0] = 0.1
        assert FRAME[0] == FRAME.buffer[0] == FRAME.coords[0]
        assert FRAME.buffer[-1] == FRAME[-1] == 29.

        FRAME.buffer[:3] = array('d', [1, 2.3, 3.4])
        assert FRAME.coords[:3] == array('d', [1, 2.3, 3.4])

        print "test slices"
        print FRAME[0:10:2] 

        arr0 = np.asarray(FRAME.buffer)
        print arr0.__len__()
        arr1 = arr0.reshape(10, 3)
        arr1[1] = [100., 200., 300.]
        print FRAME.atom_xyz
        print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        #arr0[10] = [100., 200., 300.]
        #assert frame.atom_xyz(10) == arr0[10]

        print "test memoryview for slices"
        # TODO : add
        start = 0
        stop = 10
        strip = 2
        arr = np.asarray(FRAME[start:stop:strip]) 

        # does not work, got "ValueError: ndarray is not contiguous"
        #FRAME[start:stop:strip] = arr_tmp[start:stop:strip]

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
        print frame.coords

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

        farray = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=(1,))
        frame0 = farray[0]
        print frame0
        atm = AtomMask("@CA")
        farray.top.set_integer_mask(atm)
        print dir(atm)
        frame1 = Frame(frame0, atm)
        frame2 = frame0.get_subframe(mask="@CA", top=farray.top)
        frame3 = frame0.get_subframe("@CA", farray.top)
        assert frame1.coords == frame2.coords == frame3.coords
        frame4 = frame0.get_subframe("!@CA", farray.top)
        print frame4

    def test_rmsd_return_mat_vec_vec(self):
        # TODO : add assert
        print "test_rmsd_return_mat_vec_vec"
        farray = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top", indices=(0,1))
        frame0 = farray[0]
        rmsd, mat, v1, v2 = frame0.rmsd(farray[1], get_mvv=True)
        print rmsd,  mat, v1, v2
        assert abs(rmsd - 10.3964) < 1E-3
        arr1 = np.asarray(frame0.buffer)[:3]
        print frame0.coords[:3]
        print arr1
        frame0.translate(v1)
        print v1.tolist()
        print np.array(v1.tolist(), dtype='d')
        print arr1
        print frame0[:3]

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
        arr = np.asarray(frame.coords)
        frame[0] = 1001.10
        assert frame[0] == frame.coords[0]
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
