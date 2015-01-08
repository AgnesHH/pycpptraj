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
from pycpptraj.Energy import Energy_Amber
from pycpptraj.AtomMask import AtomMask

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

ts.load(mdx, top, ArgList("trajin 1 100 10"))
frame = Frame(ts.top.n_atoms)
#ts.begin_traj()
with ts:
    ts.read_traj_frame(100, frame)
    print frame

print ts[:10]
#ts.end_traj()
#ts.prepare_for_read(True)
#frame = Frame()
#frame.set_frame_v(top, ts.has_vel(), ts.n_repdims)
#frame2 = Frame(frame)
#
## load reference
#ref = ReferenceFrame()
#ref.load_ref(refname, top)
#ref_frame = ref.frame
#
## create FrameArray to store Frame
#def get_frame_array():
#    farray = FrameArray()
#    frame = Frame()
#    frame.set_frame_v(top, ts.has_vel(), ts.n_repdims)
#    ts.begin_traj(False)
#    for i in range(10):
#        ts.get_next_frame(frame)
#        farray.append(frame)
#        #print frame.rmsd(ref_frame)
#    ts.end_traj()
#    return farray
#
#farray = get_frame_array()
#print farray[5].xyz(10) 
#print farray.size
#farray[5].swap_atoms(9, 10)
#print farray[5].xyz(9) 
#farray.erase(5)
#print farray[5].xyz(10)
#print farray.size
#
#frame = Frame(farray[5])
#del frame
#print farray[5].xyz(10)
#
#energy = Energy_Amber()
#print energy.E_torsion(farray[0], top, AtomMask("*"))
#
#print ts.top.brief("@CA")
#print ts.top.brief("@CA")
#print ts.top
#print ts.top
#
