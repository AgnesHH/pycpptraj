from pycpptraj.Parm_Amber import Parm_Amber as PA
from pycpptraj.Topology import Topology

pa = PA()
print pa.alloc()
pa.write_help()
top = Topology()
pa.read_parm("./data/Tc5b.top", top)
top.summary()
