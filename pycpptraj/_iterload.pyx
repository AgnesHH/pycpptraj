# distutils: language=c++
def _iterload(Topology top, string traj, int start=0, chunk=None):
    ts = Trajin_Single()
    ts.load(traj, top)
    if chunk is None:
        return ts.__iter__()
    else:
        return ts.frame_iter(start, chunk)
