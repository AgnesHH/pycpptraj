import os
import unittest
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Trajin import Trajin
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ReferenceFrame import ReferenceFrame

ts = Trajin_Single()
basetraj = Trajin()
datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()

top = Topology(topname)
trajin = """
"""

ts.load(mdx, ArgList(), top)
ts.prepare_for_read(True)
frame = Frame()
frame.set_frame_v(top, ts.has_vel(), ts.n_repdim)
frame2 = Frame(frame)

# load reference
ref = ReferenceFrame()
ref.load_ref(refname, top)
ref_frame = ref.frame

# create FrameArray to store Frame
def get_frame_array():
    farray = FrameArray()
    ts.begin_traj(False)
    for i in range(10):
        ts.get_next_frame(frame)
        farray.append(frame)
        #print frame.rmsd(ref_frame)
    ts.end_traj()
    return farray

farray = get_frame_array()
print farray[5].xyz(10) 
print farray.size
farray[5].swap_atoms(9, 10)
print farray[5].xyz(9) 
farray.erase(5)
print farray[5].xyz(10)
print farray.size

frame = Frame(farray[5])
del frame
print farray[5].xyz(10)
#print frame == farray[5]
        
if __name__ == "__main__":
    unittest.main()
