import os
import pycpptraj
from importlib import import_module

# get action list
pylist = os.environ['PYCPPTRAJ_HOME'] + "/PYXLIST.txt"

actions = []
with open(pylist, 'r') as fh:
    lines = fh.readlines()
    for line in lines:
        if line.startswith("actions/"):
            try:
                actions.append(line.split("/")[-1].split()[0])
            except: pass

actions.remove("Action")
actions.remove("ActionFrameCounter")

# get Help from actionlist
def get_help():
    for act_name in actions:
        module = '.actions.' + act_name
        mod = import_module(module, package='pycpptraj')
        classname = mod.__getattribute__(act_name)
        print "Help for %s" % act_name
        classname().help()
        print

from pycpptraj.actions.Action_Distance import Action_Distance
from pycpptraj.actions.Action import Action
from pycpptraj.FrameList import FrameList
from pycpptraj import cpptraj_dict
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Distance import Action_Distance
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

dist_act = Action_Distance()
toplist = TopologyList()
toplist.add_parm_file("./data/Tc5b.top")
dist_act.read_input(ArgList(":2@CA :10@CA"), toplist, FrameList(), DataSetList(), DataFileList(), 0)
dist_act.process(toplist[0])
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", toplist[0])
refframe = ref.frame
dist_act.do_action(0, refframe)
#dist.print_output()
