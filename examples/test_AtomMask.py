import unittest
from pycpptraj.base import *

class TestAtomMask(unittest.TestCase):
    def test_0(self):
        atm = AtomMask("@CA")
        print atm.n_selected
        top = Topology("./data/Tc5b.top")
        print dir(atm)
        print dir(top)
        top.set_integer_mask(atm)
        print atm.n_selected
        atm.brief_mask_info()
        print atm.mask_string()

if __name__ == "__main__":
    unittest.main()

