import unittest
from pycpptraj.base import *
from pycpptraj import NameType
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        top = Topology()
        top.add_atom(Atom("H3D", ' ', 0), 1, NameType("H3D"))
        print top.n_atoms
        print top[0]

if __name__ == "__main__":
    unittest.main()
