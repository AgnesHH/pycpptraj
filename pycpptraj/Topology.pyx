# distutils: language = c++

from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from libcpp.string cimport string
from FileName cimport FileName
from Frame cimport Frame
from NameType cimport NameType
from TopologyList cimport TopologyList

cdef class Topology:
    def __cinit__(self, *args):
        """
        args = filename or Topology instance
        """
        cdef TopologyList toplist = TopologyList()
        cdef Topology tp
        cdef string fname
        self.thisptr = new _Topology()

        # I dont make default py_free_mem (True) in __cinit__ since
        # when passing something like top = Topology(fname), Python/Cython
        # would think "fname" is value of py_free_mem
        self.py_free_mem = True

        if not args:
            #print "there is no args" # for debug
            # make empty Topology instance
            pass
        else:
            if len(args) == 1:
               if isinstance(args[0], basestring):
                   fname = args[0]
                   toplist.add_parm_file(fname)
                   self.thisptr[0] = toplist.thisptr.GetParm(0)[0]
               elif isinstance(args[0], Topology):
                   tp = args[0]
                   self.thisptr[0] =  tp.thisptr[0]
            else:
                raise ValueError()

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    @classmethod
    def copy(cls, Topology other):
        cdef Topology tmp = Topology()
        tmp.thisptr[0] = other.thisptr[0]
        return tmp

    def __getitem__(self, int idx):
        cdef Atom atom = Atom()
        atom.thisptr[0] = self.thisptr.index_opr(idx)
        return atom

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

    def file_path(self):
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

    def atom_list(self):
        """return list of atoms
        """
        cdef Atom atom 
        cdef vector[_Atom].iterator it 
        cdef vector[_Atom] v
        cdef list atlist = []

        v = self.thisptr.Atoms()
        it = v.begin()
        while it != v.end():
            atom = Atom()
            atom.thisptr[0] = deref(it)
            atlist.append(atom)
            incr(it)
        return atlist

    def summary(self):
        self.thisptr.Summary()

    def brief(self, char* heading):
        self.thisptr.Brief(heading)

    def atom_info(self, string maskString):
        self.thisptr.PrintAtomInfo(maskString)

    def bond_info(self, string maskString):
        self.thisptr.PrintBondInfo(maskString)
    
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

    def has_vel(self):
        return self.thisptr.HasVelInfo()
    
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

    #def int SetAmberExtra(self, vector[double], vector[NameType], vector[int], vector[int]):

    def setup_integer_mask(self, AtomMask atm):
        return self.thisptr.SetupIntegerMask(atm.thisptr[0])

    def setup_char_mask(self, AtomMask atm):
        return self.thisptr.SetupCharMask(atm.thisptr[0])

    def setup_integer_mask(self,AtomMask atm, Frame frame):
        return self.thisptr.SetupIntegerMask(atm.thisptr[0], frame.thisptr[0])

    def setup_char_mask(self, AtomMask atm, Frame frame):
        return self.thisptr.SetupCharMask(atm.thisptr[0], frame.thisptr[0])

    def scale_dihedral_k(self, double value):
        self.thisptr.ScaleDihedralK(value)

    def partial_modify_state_by_mask(self, AtomMask m):
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.partialModifyStateByMask(m.thisptr[0]))
        return top

    def modify_state_by_mask(self, AtomMask m):
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.modifyStateByMask(m.thisptr[0]))
        return top

    def modify_by_map(self, vector[int] m):
        cdef Topology top = Topology()
        top.thisptr[0] = deref(self.thisptr.ModifyByMap(m))
        return top
