import os
from time import time
import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.Timer import Timer
from load_traj import load
from pycpptraj.decorators import no_test

class TestFrameArray(unittest.TestCase):
    def test_help(self):
        farray = FrameArray()
        farray.read_options()
        farray.write_options()

        # classmethod
        FrameArray.read_options()
        FrameArray.write_options()

if __name__ == "__main__":
    unittest.main()
