from copy import copy
from pycpptraj.Action_Strip import Action_Strip
from pycpptraj.Action_Dihedral import Action_Dihedral
from pycpptraj.Topology import Topology
from pycpptraj.ParmFile import ParmFile
from pycpptraj.Frame import Frame
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Trajin_Single import Trajin_Single 
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Cluster_DBSCAN import Cluster_DBSCAN

top = Topology("./data/Tc5b.top")
atomlist = top.atom_list()
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", top)
refframe = ref.coord() 
mdx = "./data/md1_prod.Tc5b.x"

ts = Trajin_Single()
ts.setup_traj_read(mdx, ArgList(), top, checkBox=True)
frame = Frame()
atm = AtomMask()

# test Action_Strip
strip = Action_Strip()
input = """
strip @H outprefix teststrip
"""

strip.init(ArgList(input))
strip.setup(top)

farray = FrameArray()
farray.append(frame)
farray.append(refframe)


# Cluster_DBSCAN
db = Cluster_DBSCAN()

from pycpptraj import cpptraj_dict

adih = Action_Dihedral()
