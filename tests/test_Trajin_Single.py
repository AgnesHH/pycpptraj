import os
import unittest
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.trajs.Trajin import Trajin
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Energy import Energy_Amber
from pycpptraj.AtomMask import AtomMask

ts = Trajin_Single()
basetraj = Trajin()
datadir = "./data/"
topname = datadir + "Tc5b.top"
refilename = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()

top = Topology(topname)
trajin = """
"""

ts.load(mdx, top)
frame = Frame(ts.top.n_atoms)
#ts.begin_traj()
with ts:
    ts.read_traj_frame(100, frame)
    print frame

#print ts[:10]
#print ts[50:100]
#print ts[100:50:-2]
#print ts[100:50:-2][0]
#fa0_1 = ts[100:50:-2][1]
#fa0 = ts[100:50:-2]
#print fa0[0], fa0_1
#print ts[100:50:-2][0]
#print ts[100:50:-2][0]
#print ts[100:50:-2][0]
#print ts[0, 0, 0]
print "TEST TEST"
print ts[100][:, 0][0]
#TODO : make ts[0, 0:3, :] work
#print ts[0, slice(0, 3)]
#print ts[0:30:40]
#assert ts[0, 0, 0] == ts[0][0, 0]
#print ts[0][:, :].shape
