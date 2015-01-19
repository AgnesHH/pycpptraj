# adapted from CSB package
# dir: http://csb.codeplex.com/
# turn-off numpy.sum, numpy.power
# use builtin `sum`
# TODO : add more acknowledgement
from pycpptraj.DistRoutines import distance_frames

def _tm_d0(Lmin):
    if Lmin > 15:
        d0 = 1.24 * (Lmin - 15.0)**(1.0 / 3.0) - 1.8
    else:
        d0 = 0.5
    return max(0.5, d0)

def tm_score(x, y, L=None, d0=None):
    """
    Evaluate the TM-score of two Frames (no fitting is done).
    Return : float
    
    Parameters:
    ----------
    x : Frame instance
        Frame 1
    y : Frame instance 
        Frame 2
    L: length for normalization (default: ?)
    d0: d0 in Angstroms (default: calculate from C{L})
    """
    import numpy as np

    if not L:
        L = x.n_atoms
    if not d0:
        d0 = _tm_d0(L)
    # convert Python array to numpy array 
    d = np.array(distance_frames(x, y))
    return sum(1 / (1 + (d / d0) ** 2)) / L
