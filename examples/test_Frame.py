import unittest
from array import array
import numpy as np
from numpy.testing import assert_almost_equal
from pycpptraj.Frame import Frame
from pycpptraj.base import *

SMALL = 1E-6
class TestFrame(unittest.TestCase):
    def test_1(self):
        N_ATOMS = 10
        # create frame instance with 10 atoms
        frame = Frame(N_ATOMS)
        frameref = Frame(N_ATOMS)
        
        arr = np.random.rand(N_ATOMS * 3)
        arr_reshape = arr.reshape(N_ATOMS, 3)
        frame.set_from_crd(arr, 30, 0, False)
        assert frame.n_atoms == N_ATOMS
        assert frame.size == N_ATOMS*3
        
        print frame.xyz(0)
        print arr_reshape[0]
        assert_almost_equal(np.array(frame.xyz(0)), arr_reshape[0])
        assert_almost_equal(frame[0], arr[0])

        # frame.info('frame info')
        print "before swapping 1 - 8"
        frame.print_atom_coord(1)
        frame.print_atom_coord(8)
        frame.swap_atoms(1, 8)
        
        print "after swapping 1 - 8"
        frame.print_atom_coord(1)
        frame.print_atom_coord(8)

        print "update coords for atom 1"
        frame.update_atom(1, array('d', [1., 1000., 3000.]))
        print frame.xyz(1)
        print frame[3]
        print "assign frame[3] to 1000000."
        frame[3] = 1000000.
        print frame.xyz(1)
        
        print "deviding Frame"
        frame.divide(2.)
        frame.print_atom_coord(1)
        frame.print_atom_coord(8)

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

        print "set zero_coords"
        frame.zero_coords()
        print frame.coords.__len__()
        arr = np.asarray(frame.coords)
        frame[0] = 1001.10
        assert frame[0] == frame.coords[0]
        print frame[0]
        
        arrref = np.random.rand(30)
        frameref.set_from_crd(arr, 30, 0, False)

if __name__ == "__main__":
    unittest.main()
