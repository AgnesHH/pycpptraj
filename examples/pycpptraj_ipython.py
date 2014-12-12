from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Trajin_Single import Trajin_Single 
from pycpptraj.ArgList import ArgList

top = Topology("./data/Tc5b.top")
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", top)
refframe = ref.coord() 
mdx = "./data/md1_prod.Tc5b.x"

ts = Trajin_Single()
ts.setup_traj_read(mdx, ArgList(), top, checkBox=True)
frame = Frame()
