from libcpp.string cimport string
from .Trajin_Single cimport Trajin_Single
from .Topology cimport Topology

def _iterload(Topology top, string traj, int start=0, chunk=None):
    ts = Trajin_Single()
    ts.load(traj, top)
    if chunk is None:
        return ts.__iter__()
    else:
        return ts.frame_iter(start, chunk)