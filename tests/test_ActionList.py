import unittest
from time import time
from pycpptraj.base import *
from pycpptraj import allactions
from pycpptraj import io as mdio

class TestActionList(unittest.TestCase):
    
    print "test ActionList"
    farray = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
    stripact = allactions.Action_Strip()
    dsetlist = DataSetList()
    dflist = DataFileList()
    alist = ActionList()
    toplist = TopologyList()
    toplist.add_parm(farray.top)
    alist.add_action(stripact, ArgList("@H*"), toplist, None, dsetlist, dflist)
    alist.add_action(allactions.Action_Distance(), ArgList(":2@CA :3@CA"), toplist, None, dsetlist, dflist)
    print "test setup_actions"
    print alist.n_actions
    alist.setup_actions(toplist[0])
    alist.setup_actions(farray.top.copy())

    t0 = time()
    farray2 = FrameArray()
    frame0 = Frame()
    for frame in farray:
        alist.do_actions(frame)
        farray2.append(frame)
    print time() - t0

    print farray2.size
    print farray2.n_frames
    print farray2[0].n_atoms
    print farray[0].n_atoms

    ds = cast_dataset(dsetlist[0], dtype='general')
    print ds[:10]

if __name__ == "__main__":
    unittest.main()
