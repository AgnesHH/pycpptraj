#from pycpptraj

def rmsd(frames, ref, mask, use_mass=True, fit=True):
    """
    Output: array of rmsd values
    Input:
    =====
    frames :: FrameList instance
    ref :: Reference instance
    mask :: AtomMask instance
    use_mase :: bool
    fit :: fit or no_fit
    """
    # Should I use the MDTraj's interface?
