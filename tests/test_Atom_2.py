import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        atom = Atom()
        print atom.get_all_atomic_elements()
        alist = Atom.get_all_atomic_elements()
        print alist
        assert atom.get_bond_length('NITROGEN', 'IODINE') == 1.6
        assert atom.get_bond_length('nitrogen', 'iodine') == 1.6

if __name__ == "__main__":
    unittest.main()
