from pycpptraj import CpptrajState

# load prmtop file
def load_parm():
    pass

def create_state(top=None, trajin=None, ref=None):
    """Return CpptrajState instance

    Paraters:
    ========
    top :: topology filename (or topology instance or either?)
    trajin :: trajectory filename (or trajectory instance or either?)
    ref :: reference filename (or ReferenceFrame instance or either?)
    """
    state = CpptrajState()
    state.toplist.add_parm_file(top)
    state.add_trajin(trajin)
    state.add_reference(ref)
    return state
