from copy import copy
from pycpptraj.FrameList import FrameList
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action import Action
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList
from pycpptraj.actions.Action_Dihedral import Action_Dihedral
from pycpptraj.Topology import Topology
from pycpptraj.ParmFile import ParmFile
from pycpptraj.Frame import Frame
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Trajin_Single import Trajin_Single 
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Cluster_DBSCAN import Cluster_DBSCAN
from pycpptraj.ActionList import ActionList
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj._FunctPtr import FunctPtr
from pycpptraj.actions.Action import Action
from pycpptraj.PointerVec import TopVec, FrameVec

top = Topology("./data/Tc5b.top")
atomlist = top.atom_list()
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", top)
refframe = ref.frame
mdx = "./data/md1_prod.Tc5b.x"

ts = Trajin_Single()
ts.load(mdx, ArgList(), top)
frame = Frame()
atm = AtomMask()

# test Action_Strip
strip = Action_Strip()
strip.help()
input = """
:1-20@CA outprefix teststrip nobox
"""

input2 = """
strip :1-20@CA
"""

arglist = ArgList(input)

farray = FrameArray()
farray.append(frame)
farray.append(refframe)


# Cluster_DBSCAN
db = Cluster_DBSCAN()

from pycpptraj import cpptraj_dict
adih = Action_Dihedral()
#adih.init(ArgList(":1@C :2@CC :2@N :2C "), TopologyList() , FrameList(), DataSetList(), DataFileList () , 0)
armsd = Action_Rmsd()
toplist = TopologyList()
toplist.add_parm_file("./data/Tc5b.top")
strip.init(arglist, toplist, FrameList(), DataSetList(), DataFileList () , 0)
armsd.setup(top)
#armsd.do_action(1, refframe)

#for action in [adih, armsd]:
#    action.help()

alist = ActionList()
alist.add_action(armsd, arglist, toplist, FrameList(), DataSetList(), DataFileList())
alist.setup_actions(top)
#alist.do_actions(refframe, 1)
alist.add_action(adih, ArgList(), TopologyList(), FrameList(), DataSetList(), DataFileList())
alist.setup_actions(top)

# 
#print "Test CpptrajState"
#cppstate = CpptrajState()
#cppstate.add_action(armsd, arglist)
#cppstate.run()
#
## testing PointerVector
#import numpy as np
#
#frame = Frame(10)
#arr = np.random.rand(30)
#print arr.__len__()
#print arr
#
#alist.action_alloc(0)
#act = Action_Rmsd.get_action_from_functptr(alist.action_alloc(0))
#armsd.help()
#act.help()
#print act
#
## try to get out of range index.
#print alist.n_actions
#act = Action_Rmsd.get_action_from_functptr(alist.action_alloc(1000))
#act.help()
