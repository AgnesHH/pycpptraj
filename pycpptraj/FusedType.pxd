# distutils: language = c++
from Matrix_3x3 cimport Matrix_3x3
from Vec3 cimport Vec3
from .actions.Action_Dihedral cimport _Action_Dihedral
from .actions.Action_Rmsd cimport _Action_Rmsd
#from Topology cimport atom_iterator, res_iterator, mol_iterator
#from Topology cimport Topology
#from Atom cimport Atom

#ctypedef fused CommonClassCpptraj:
#    Atom
#    Topology
#
#ctypedef fused IteratorCpptraj:
#    atom_iterator
#    res_iterator
#    mol_iterator

ctypedef fused MatVecType:
    Matrix_3x3
    Vec3

ctypedef fused FusedAction:
    _Action_Rmsd
    _Action_Dihedral
