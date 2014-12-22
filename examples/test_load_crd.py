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

def load_crd(topfile, crdfile):
    """
    Load trajectory from topology + crd file
    Output:
    =====
    Trajectory instance
    TODO: does not worked yet
    """
    state = CpptrajState()
    input = "parm %s" % topfile
    parm = Topology(topfile)
    parm.summary()
    trajin = Trajin_Single()
    trajin.load(crdfile, ArgList(), parm)
    frame_in = Frame()
    frame_in.set_frame_v(parm, trajin.has_vel(), trajin.n_repdim)
    #print trajin.trajfilename()
    setname = trajin.trajfilename().base()
    print setname
    coords = state.datasetlist.find_set_of_type(setname, DataSetDict["COORDS"]) 
    if coords.empty():
        coords = state.datasetlist.addset("COORDS", setname, "__DCRD__")
        coords.set_topology(parm)
    # check n_atoms in coords and parm
    if not parm.n_atoms == coords.top.n_atoms:
        raise ValueErro("parm and coords need to have the same n_atom")
    return state

topfile="./data/Tc5b.top"
crdfile = "./data/md1_prod.Tc5b.x"

state = load_crd(topfile, crdfile)
