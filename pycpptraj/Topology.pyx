# distutils: language = c++

from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from libcpp.string cimport string
from FileName cimport FileName
from Frame cimport Frame
from NameType cimport NameType
from TopologyList cimport TopologyList

cdef class Topology:
    def __cinit__(self, string fname='', *args):
        cdef TopologyList toplist = TopologyList()
        cdef Topology tp
        self.thisptr = new _Topology()

        if not fname.empty() and not args:
            toplist.add_parm_file(fname)
            self.thisptr[0] = toplist.thisptr.GetParm(0)[0]
        elif fname.empty() and args:
            raise NotImplementedError()
            #pt = args[0]
            #self.thisptr = new _Topology(tp.thisptr[0])

    def __dealloc__(self):
        del self.thisptr

    def __getitem__(self, int idx):
        cdef Atom atom = Atom()
        pass

    def atom_generator(self):
        cdef Atom atom
        cdef atom_iterator it
        it = self.thisptr.begin()
        while it != self.thisptr.end():
            atom = Atom()
            atom.thisptr[0] = deref(it)
            yield atom
            incr(it)

    def res_generator(self):
        cdef Residue res
        cdef res_iterator it
        it = self.thisptr.ResStart()
        while it != self.thisptr.ResEnd():
            res = Residue()
            res.thisptr[0] = deref(it)
            yield res
            incr(it)
        
    def mol_generator(self):
        cdef Molecule mol
        cdef mol_iterator it
        it = self.thisptr.MolStart()
        while it != self.thisptr.MolEnd():
            mol = Molecule()
            mol.thisptr[0] = deref(it)
            yield mol
            incr(it)

    def set_parm_name(self, string title, FileName filename):
        self.thisptr.SetParmName(title, filename.thisptr[0])

    def set_reference_coords(self, Frame frameIn):
        self.thisptr.SetReferenceCoords(frameIn.thisptr[0])

    def c_str(self):
        return self.thisptr.c_str()

    def trunc_res_atom_name(self, int atom):
        return self.thisptr.TruncResAtomName(atom)

    def atom_mask_name(self, int atom):
        return self.thisptr.AtomMaskName(atom)

    def trunc_res_name_num(self, int res):
        return self.thisptr.TruncResNameNum(res)

    def find_atom_in_residue(self, int res, NameType atname):
        return self.thisptr.FindAtomInResidue(res, atname.thisptr[0])
    
    def find_residue_max_natom(self):
        return self.thisptr.FindResidueMaxNatom()
    
    #def SoluteAtoms(self):
    #    return self.thisptr.SoluteAtoms()

    #def atom_list(self):
    #    # need iterator?
    #    # do I need this method?
    #    # return list of atoms
    #    cdef Atom atom = Atom()
    #    cdef _Atom at
    #    cdef atlist = []

    #    # self.thisptr.Atoms() return an _Atom vector
    #    for at in self.thisptr.Atoms():
    #        atom.thisptr[0] = at
    #        atlist.append(atom)
    #    return atlist

    def summary(self):
        self.thisptr.Summary()

    def brief(self, char* heading):
        self.thisptr.Brief(heading)

    def atom_info(self, string maskString):
        self.thisptr.PrintAtomInfo(maskString)

    #def PrintBonds(self, BondArray barray, AtomMask maskIn, int nb):
    #    self.thisptr.PrintBonds(barray, maskIn, nb)

    def bond_info(self, string maskString):
        self.thisptr.PrintBondInfo(maskString)
    
    #def PrintAngles(self):
    #    self.thisptr.PrintAngles()

    def angle_info(self, string maskString):
        self.thisptr.PrintAngleInfo(maskString)

    def dihedral_info(self, string maskString):
        self.thisptr.PrintDihedralInfo(maskString)

    def molecule_info(self, maskString):
        self.thisptr.PrintMoleculeInfo(maskString)

    def residue_info(self, string maskString):
        self.thisptr.PrintResidueInfo(maskString)

    def charge_mass_info(self, string maskString, int idtype):
        self.thisptr.PrintChargeMassInfo(maskString, idtype)
    
    def add_top_atom(self, Atom atomIn, int o_resnum, NameType resname, double[:] XYZin):
        return self.thisptr.AddTopAtom(atomIn.thisptr[0], o_resnum, resname.thisptr[0], &XYZin[0])

    def start_new_mol(self):
        self.thisptr.StartNewMol()

    def common_setup(self, bint bondsearch):
        return self.thisptr.CommonSetup(bondsearch)

    def set_offset(self, double x):
        self.thisptr.SetOffset(x)

    def set_ipol(self, int id):
        self.thisptr.SetIpol(id)

    #def NextraPts(self):
    #    pass

    #def HasVelInfo(self):
    #    return self.thisptr.HasVelInfo()

    def original_filename(self):
        cdef FileName fname = FileName()
        fname.thisptr[0] = self.thisptr.OriginalFilename()
        return fname

    property p_index:
        def __get__(self):
            return self.thisptr.Pindex()

    property n_atoms:
        def __get__(self):
            return self.thisptr.Natom()

    property n_res:
        def __get__(self):
            return self.thisptr.Nres()

    property n_mol:
        def __get__(self):
            return self.thisptr.Nmol()

    property n_solvent:
        def __get__(self):
            return self.thisptr.Nsolvent()

    property n_frames:
        def __get__(self):
            return self.thisptr.Nframes()

    property n_repdim:
        def __get__(self):
            return self.thisptr.NrepDim()

    property parm_name:
        def __get__(self):
            return self.thisptr.ParmName()

    property GB_radiiset:
        def __get__(self):
            return self.thisptr.GBradiiSet()

    def partial_modify_state_by_mask(self, AtomMask m):
        # TODO: This code does not work correctly. Give None topoplogy instance
        # cpptraj: return Topology*
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.partialModifyStateByMask(m.thisptr[0]))
        return top

    def modifyStateByMask(self, AtomMask m):
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.modifyStateByMask(m.thisptr[0]))
        return top

    def modify_by_map(self, vector[int] m):
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.ModifyByMap(m))
        return top
