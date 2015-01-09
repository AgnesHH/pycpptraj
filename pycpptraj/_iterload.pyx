# distutils: language=c++
from libcpp.string cimport string
from pycpptraj.Topology cimport Topology
from pycpptraj.Trajin_Single cimport Trajin_Single

def _iterload(Topology top, string traj, int start=0, chunk=None):
    """Iterately loading trajectory from file with provided topology file
    We use cpptraj "Trajin_Single" class to fast reading
    """
    ts = Trajin_Single()
    ts.load(traj, top)
    if chunk is None:
        return ts.__iter__()
    else:
        return ts.frame_iter(start, chunk)
