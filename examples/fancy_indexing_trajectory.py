from pycpptraj import io as mdio
from pycpptraj import Trajout

traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")[:]
# get x coord of 0-th atom of 0-th frame
print traj[0, 0, 0]

# get new array with shape = (traj.n_frames, n_atoms, 3)
print traj[:, :, :]

# get new array with shape (n_atoms, 3) for 0-th frame
print traj[0, :, :]

