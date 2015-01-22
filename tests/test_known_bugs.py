"""for testing bugs
"""
import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio

class TestBugs(unittest.TestCase):
    def test_0(self):
        trajcpp = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        farray = trajcpp[:]
        print farray[0, 0, 0]
        print trajcpp[0, 0, 0]

if __name__ == "__main__":
    unittest.main()
