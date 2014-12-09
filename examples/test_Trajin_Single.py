import os
from pycpptraj.Frame import Frame
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology

ts = Trajin_Single()

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
#mdx = datadir + "Tc5b.nat.crd"
mdx = datadir + "md1_prod.Tc5b.x"

top = Topology(fname=topname)
print top

trajin = """
trajout ./data/test.r
"""

arglist = ArgList(trajin)
print arglist

ts.SetupTrajRead(mdx, arglist, top, checkBox=True)
ts.BeginTraj(1)
#frame = Frame()
#print ts.ReadTrajFrame(10, frame)
#print frame
ts.EndTraj()
ts.PrintInfo(1)
#print ts.HasVelocity()
#print ts.NreplicaDimension()
