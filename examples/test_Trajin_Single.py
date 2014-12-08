import os
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology

ts = Trajin_Single()

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
fname = datadir + "Tc5b.Tc5b.nat.crd"

top = Topology(fname=topname)
print top

trajin = """
trajin ./data/md1_prod.r
trajout ./data/test.r
"""

arglist = ArgList(trajin)
print arglist

ts.SetupTrajRead(fname, arglist, top, checkBox=True)
#ts.BeginTraj(True)
#ts.EndTraj()
#ts.PrintInfo(1)
#print ts.HasVelocity()
#print ts.NreplicaDimension()


