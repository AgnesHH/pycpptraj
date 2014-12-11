#from pycpptraj

def rmsd(traj, ref, mask, indices=[], use_mass=True, fit=True):
    """
    Output: array of rmsd values
    
    Input:
    =====
    traj: Trajin_Single instance
    ref :: Reference instance
    mask :: AtomMask instance
    indices: index list showing frame id
    use_mase :: bool
    fit :: fit or no_fit

    """
    # get ref_frame (Frame instance)
    ref_frame = ref.coord()
    for idx in indices:
        pass
