import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj import allactions
from pycpptraj.cast_dataset import cast_dataset

# load traj
farray = mdio.load(top=Topology("./data/Tc5b.top"), 
                       filename='data/md1_prod.Tc5b.x',)

# create dataset to hold data
dslist = DataSetList()

# creat Action_Radgyr
act = allactions.Action_Radgyr()

# read input and process input
act.read_input("radgyr @CA", farray.top, dslist=dslist)
act.process(farray.top)

# do calculation for each frame. rad of gyr is appended to dslist
for i, frame in enumerate(farray):
    act.do_action(i, frame)

# get dataset.
d1 = cast_dataset(dslist[0], dtype="general")

# print
print d1.data[:10]
print dir(d1)
