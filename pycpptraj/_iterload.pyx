from libcpp.string cimport string
from .Trajin_Single cimport Trajin_Single
from .Topology cimport Topology

def _iterload(Topology top=None, string traj=''):
    ts = Trajin_Single()
    ts.load(traj, top)
    return ts.__iter__()
