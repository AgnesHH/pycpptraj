from pycpptraj.Frame import Frame
from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.ArgList import ArgList

#atm = AtomMask("@CA")
#atm.mask_info()
#atm.add_atom_range(0, 10)
#atm.mask_info()
#print atm.mask_string_set()

trajinput = """
noprogress
parm ../tz2.ortho.parm7
trajin ../tz2.ortho.nc 1 1
mask "(:5 <:3.0) & :WAT" maskout mask.out maskpdb mask.pdb
"""

arglist = ArgList(trajinput)
maskFilename = arglist.get_string_key("maskout")
print maskFilename

maskpdb = arglist.get_string_key("maskpdb")
print maskpdb

mask1 = AtomMask()
mask1.set_mask_string(arglist.get_mask_next())
mask1.brief_mask_info()

top = Topology("./data/Tc5b.top")
top.setup_integer_mask(mask1)
