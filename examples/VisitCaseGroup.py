from pycpptraj.Trajectory import Trajectory

traj = Trajectory("data/md1_prod.Tc5b.x", "./data/Tc5b.top")
print traj[:100] + traj[300:500:2] + traj[600:] + traj[500:200:-2] + traj[-1:-15:]
print traj[-1:-3:-1]

for frame in traj:
    print frame
