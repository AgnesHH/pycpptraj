import unittest
from pycpptraj.base import *

class Test(unittest.TestCase):
    def test_0(self):
        # DataSet_Coords_TRJ class
        traj = TrajectoryReadOnly()
        traj.top = Topology("data/Tc5b.top")
        traj.load("data/md1_prod.Tc5b.x")
        print dir(traj)
        print traj.size
        dset = traj.alloc()
        #print dir(dset)
        print dset.data_format
        print dset.is_empty()
        print dset.data_type
        print dset.column_width
        db = cast_dataset(dset, dtype="general")
        #print cast_dataset.__doc__
        print db.is_empty()
        #print dir(db)

    def test_addtrajin(self):
        traj = TrajectoryReadOnly()
        traj.top = Topology("data/Tc5b.top")
        traj.load("data/md1_prod.Tc5b.x")

        trajin = Trajin_Single(fname="data/md1_prod.Tc5b.x", top=traj.top)
        print dir(trajin)
        dset = traj.alloc()
        db = cast_dataset(dset, dtype="general")
        print db
        #traj.add_traj

    def test_addtrajin_from_emptyTRJ(self):
        traj = TrajectoryReadOnly()
        traj.top = Topology("data/Tc5b.top")
        trajin = Trajin_Single(fname="data/md1_prod.Tc5b.x", top=traj.top)
        traj.addtraj(trajin)

if __name__ == "__main__":
    unittest.main()

