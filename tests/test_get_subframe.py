import unittest
from array import array
from pycpptraj.base import *
from pycpptraj.misc import get_subframe

class TestSubFrame(unittest.TestCase):
    def test_0(self):
        frame = Frame(range(300))
        assert frame.size == 300
        assert frame.n_atoms == 100
        assert frame.coords == array('d', [x for x in range(300)])

if __name__ == "__main__":
    unittest.main()

