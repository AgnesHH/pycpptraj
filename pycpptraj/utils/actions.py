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
