from ParmFile import ParmFile
from Topology import Topology

top = Topology()
parm = ParmFile()

fname = "./test_PyCpptraj/Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top"

parm.ReadTopology(top, fname, 1)
print top.Natom

fname = parm.ParmFilename()
print fname.full()
