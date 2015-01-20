from pycpptraj import io as mdio
from pycpptraj import Trajout
Trajout().help()

traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")

# etract first 10 frames and write to CHARMM format
subtraj = traj[:10]
mdio.writetraj(filename="./output/subtraj_0_CHARMM.dcd", traj=subtraj, 
               top=traj.top,
               fmt="CHARMMDCD",
               overwrite=True)

# make sure we can load the traj,
# use AMBER top is fine
charmm_traj = mdio.load("./output/subtraj_0_CHARMM.dcd", "./data/Tc5b.top")

# calculate rmsd between old and saved traj for 1st frame
print charmm_traj[0].rmsd(subtraj[0])
assert charmm_traj[0].rmsd(subtraj[0]) < 1E-6
