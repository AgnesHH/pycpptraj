from pycpptraj.ParmFile import ParmFile
from pycpptraj.Topology import Topology
from pycpptraj.cpptraj_dict import ParmFormatDict, DataSetDict

def write_parm(top=None, prefix="temp", parmtype='AMBERPARM'):
    """
    Write new topology file

    Parameters:
    =========
    top : topology instance
    prefix : filename prefix
    parmtype : AMBERPARM, ...
    """
    pfile = ParmFile()
    parmtype = ParmFormatDict[parmtype]
    pfile.write_prefix_topology(top, prefix, parmtype, 0)

def strip_parm(top=None, mask=None):
    pass

def load_parm(topname):
    """
    Load topology from file
    Return: Topology instance
    >>> top = load_parm("./data/Tc5b.top")
    """
    top = Topology(topname)
    return top

def load_traj(top, trajfile):
    pass

# translated from cpptraj (Command.cpp)
def load_crd(top, arglist):
    state = CpptrajState()
    parm = state.toplist.get_parm(arglist)
    trajin = Trajin_Single()
    trajin.set_debug(0)
    trajin.setup_traj_read(arglist.get_tring_next(), arglist, parm)
    frame_in = Frame()
    frame_in.set_frame_v(parm, trajin.has_vel(), traj.n_repdim)
    setname = arglist.get_string_next()
    if not setname:
        setname = trajin.traj_filename.base()
    coords = state.datasetlist.find_set_of_type(setname, DataSetDict["COORDS"]) 
    if coords.empty():
        coords = state.datasetlist.addset("COORDS", setname, "__DCRD__")
    coords.set_topology(parm)


def calculate(input, action=''):
    """
    Output : raw data from cpptraj

    Input:
    =====
    action :: str, action keyword
    input :: str or ArgList instance
    """
    # create action instance from action text
    # create ArgList instance
    pass
