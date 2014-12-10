from pycpptraj.AtomMask import AtomMask

atm = AtomMask("@CA")
atm.mask_info()
atm.add_atom_range(0, 10)
atm.mask_info()
