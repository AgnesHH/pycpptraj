from pycpptraj.Molecule import Molecule

mol = Molecule(1, 304)

print mol.BeginAtom
print mol.EndAtom
print mol.NumAtoms
print mol.IsSolvent()


# test wrong inputs
# mol2 = Molecule(1, 2, 3)
