import os
import unittest
from pycpptraj.TrajectoryFile import TrajectoryFile

class TestTraj(unittest.TestCase):
    def test_1(self):
        traj = TrajectoryFile()
        t = traj.get_type_from_ext(".nc")
        assert t == "AMBERNETCDF"
        print t
        ext = traj.get_ext_for_type("AMBERNETCDF")
        assert ext == ".nc"
        print ext
        fs = traj.format_string("AMBERNETCDF")
        assert fs == "Amber NetCDF"
        print fs

if __name__ == "__main__":
    unittest.main()
