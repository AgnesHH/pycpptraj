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
print ts[50:100]
