import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj import action_help
from pycpptraj import allactions
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_action(self):
        action_help()
        action_help("PairDist")
        print 
        action_help("Dihedral")

        dslist = DataSetList()

        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        act = allactions.Action_Dihedral()
        act.read_input("dihedral :4@C :5@N :5@CA :5@C range360  mass ", 
                       current_top=traj.top, dslist=dslist)
        print traj.top
        act.process(current_top=traj.top)
        print act.process.__doc__

        for i, frame in enumerate(traj):
            act.do_action(i, frame)

        d0 = cast_dataset(dslist[0])
        print d0[:10]

if __name__ == "__main__":
    unittest.main()
