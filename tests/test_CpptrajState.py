import os
from pycpptraj import io as mdio
from pycpptraj.base import *
from pycpptraj import allactions

# setup filenames
datadir = "./data/"
topname = datadir + "Tc5b.top"
trajoutname = datadir + "test.x"
refilename = "./data/Tc5b.nat.crd"
trajinname = datadir + "md1_prod.Tc5b.x"


#creat TrajinList instance
trajininput= """
parm ./data/Tc5b.top
trajin ./data/md1_prod.Tc5b.x
dih :1@C :2@N :2@CA :2@C
"""

argIn = ArgList(trajininput)

import unittest

class TestCpptrajState(unittest.TestCase):
    
    def test_run(self):
        print "test_process_input"
        state2 = CpptrajState()

        toplist = state2.toplist
        toplist.add_parm("./data/Tc5b.top")

        state2.add_trajin("./data/md1_prod.Tc5b.x")

        state2.add_reference("./data/Tc5b.nat.crd")
        state2.add_trajout("./output/test.out")

        state2.add_action(allactions.Action_Distance(), 
                          ArgList("distance :2@CA :10@CA out ./output/dist_test.txt"))

        state2.add_action(allactions.Action_Distance(), ArgList("distance :4@CA :10@CA"))

        state2.framelist.set_active_ref(0)
        print "test framelist.list()"
        state2.run()
        dslist = state2.datasetlist
        d0 = dslist[0]
        print "d0 is empty? ", d0.is_empty()
        d1 = cast_dataset(d0, dtype="general")
        print "d1 is empty? ", d1.is_empty()
        print d1.data[0:10]


    def test_action(self):
        distaction = allactions.Action_Distance()
        boxaction = allactions.Action_Box()
        boxaction.help()
        toplist = TopologyList()
        framelist = FrameList()
        dsetlist = DataSetList()
        dflist = DataFileList()

        # add stuff
        toplist.add_parm("./data/Tc5b.top")
        framelist.add_reference(ArgList("./data/Tc5b.nat.crd"), toplist)
        distaction.read_input(ArgList(":2@CA :10@CA"), toplist, framelist, dsetlist, dflist, 0)
        boxaction.read_input(ArgList("x 1000. y 1000. alpha 500."), toplist, framelist, dsetlist, dflist, 0)
        distaction.process(toplist[0])

        idx = 0
        farray = FrameArray("./data/Tc5b.nat.crd", "./data/Tc5b.top")
        distaction.do_action(0, farray[idx])
        frame0 = farray[idx]
        # update Frame instance with new Box info
        boxaction.do_action(idx, frame0)
        print frame0.get_box()
        mdio.writetraj(filename="test_withbox.r", traj=frame0, 
                       top=farray.top, fmt='AMBERRESTART',
                       overwrite=True)
        frame0.set_nobox()
        print frame0.get_box()
        mdio.writetraj(filename="test.r", traj=frame0, 
                       top=farray.top, fmt='AMBERRESTART',
                       overwrite=True)

if __name__ == "__main__":
    unittest.main()
