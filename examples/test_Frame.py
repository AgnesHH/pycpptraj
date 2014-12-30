import unittest
import numpy as np
from numpy.testing import assert_almost_equal
from pycpptraj.Frame import Frame

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
        
        print "deviding Frame"
        frame.divide(2.)
        frame.print_atom_coord(1)
        frame.print_atom_coord(8)
        
        
        arrref = np.random.rand(30)
        frameref.set_from_crd(arr, 30, 0, False)
        

if __name__ == "__main__":
    unittest.main()
