import os
from pycpptraj.AtomMask import AtomMask
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName
from pycpptraj.Frame import Frame
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.Energy import Energy_Amber
from pycpptraj.ArgList import ArgList

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
filename = "./data/md1_prod.Tc5b.x"

top = Topology(topname)
#top.summary()
ref = ReferenceFrame()
#ref.load_ref(filename=filename, top=top, debug=0, arglist=ArgList(), mask="@CA")
ref.load_ref(filename, top, arglist=ArgList(), mask="@CA")
ref.top.summary()
print ref.frame
name = ref.frame_name()
assert name.full_name == filename
#assert name.ext == '.crd'
ref.info()
