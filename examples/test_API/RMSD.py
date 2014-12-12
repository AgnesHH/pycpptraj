from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.ArgList import ArgList
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.ReferenceFrame import ReferenceFrame

def rmsd(topname, refname, trajname, mask='', use_mass=True, fit=True):
    """
     TODO: update this doc
    Output: array of rmsd values
    
    Input:
    =====
    topname :: Amber topology file name
    refname :: Reference file name
    mask :: AtomMask string
    use_mase :: bool
    fit :: fit or no_fit

    """
    # get ref_frame (Frame instance)
    atm = AtomMask(mask)
    top = Topology(topname)
    modtop = top.modifyStateByMask(atm)
    modtop.summary()
    ref = ReferenceFrame()
    ref.load_ref(refname, top)
    ref = ref.set_coordinates(ref, atm)

    trajin = Trajin_Single()
    trajin.setup_traj_read(trajname, ArgList(), top, checkBox=True)

    arr = np.empty(trajnam.total_frames)

    for i in range(trajin.total_frames):
        trajin.get_next_frame(frame)
        frame = frame.set_coordinates(frame, atm)
        arr[i] = frame.rmsd(ref)
    return arr

if __name__ == '__main__':
    topname = "../data/Tc5b.top"
    refname = "../data/Tc5b.nat.crd"
    trajname = "../data/md1_prod.Tc5b.x"
    mask = ":3-18@CA"
    arr = rmsd(topname, refname, trajname, mask)
    print arr
