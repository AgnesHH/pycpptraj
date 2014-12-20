from pycpptraj.ParmFile import ParmFile
from pycpptraj.Topology import Topology
from pycpptraj.cpptraj_dict import ParmFormatDict

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

def load_crd(top, crdfile):
    pass

def calculate(action='', input):
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
