import os
from array import array
from pycpptraj import ArgList
from pycpptraj._cast import cast_dataset
from pycpptraj.actions.Action_Radgyr import Action_Radgyr
from pycpptraj.actions.Action_Molsurf import Action_Molsurf
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_ClusterDihedral import Action_ClusterDihedral
from pycpptraj.CpptrajState import CpptrajState
from test_API.TestAPI import create_state, do_calculation
from pycpptraj.FrameArray import FrameArray

#testdir = os.environ['PYCPPTRAJ_HOME'] + "/tests/Cpptraj_test/"
#topfile = testdir + "Test_Matrix/1rrb_vac.prmtop"
#trajinfile = testdir + "Test_Matrix/1rrb_vac.mdcrd"
testdir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topfile = testdir + "Tc5b.top"
trajinfile = testdir + "md1_prod.Tc5b.x"

state = create_state(top=topfile, trajin=trajinfile, ref=None)
#state.add_action(Action_Molsurf(), ArgList("surf"))
#state.add_action(Action_Molsurf(), ArgList("surf @CA"))
state.add_action(Action_Strip(), ArgList("strip @H"))
state.run()
trajlist = state.get_trajinlist()
#print trajlist.size
traj = trajlist.__iter__().next()

farray = FrameArray()
farray.get_frames(traj, update_top=True)
farray.top.summary()
print farray.top
print traj.top 
print traj.top == farray.top
print farray[0].xyz(0)
print farray[0].xyz(303)

print "crd"
print farray[0].crd(0)
print farray[0].crd(911)
print farray[0].coords.__len__()


