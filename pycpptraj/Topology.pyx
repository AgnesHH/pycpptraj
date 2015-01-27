# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from libcpp.string cimport string
from pycpptraj.TopologyList cimport TopologyList

from pycpptraj.decorators import name_will_be_changed

# Python level
# use for write parm
#from pycpptraj.parms.Parm_Amber import Parm_Amber
# creat easy way to build new top from scratch

cdef class Topology:
    def __cinit__(self, *args):
        """
        args = filename or Topology instance
        """
        cdef TopologyList toplist = TopologyList()
        cdef Topology tp
        cdef string filename
        self.thisptr = new _Topology()

        # I dont make default py_free_mem (True) in __cinit__ since
        # when passing something like top = Topology(filename), Python/Cython
        # would think "filename" is value of py_free_mem
        self.py_free_mem = True

        if not args:
            #print "there is no args" # for debug
            # make empty Topology instance
            pass
        else:
            if len(args) == 1:
               if isinstance(args[0], basestring):
                   filename = args[0]
                   toplist.add_parm(filename)
                   self.thisptr[0] = toplist.thisptr.GetParm(0)[0]
               elif isinstance(args[0], Topology):
                   tp = args[0]
                   self.thisptr[0] =  tp.thisptr[0]
            else:
                raise ValueError()

    def __dealloc__(self):
        if self.py_free_mem and self.thisptr:
            del self.thisptr

    def __str__(self):
        tmp = "%s instance with %s atoms. ID = %s" % (
                self.__class__.__name__,
                self.n_atoms,
                hex(id(self))
                )
        return tmp

    def __repr__(self):
        return self.__str__()

    def load(self, string filename):
        """loading Topology from filename

        filename : {str}

        if Topology instance is not empty, it will be still replaced by new one

        # seriously why do we need this method?
        >>> top = Topology("./data/Tc5b.top")
        >>> # replace old with new topology
        >>> top.load("./data/HP36.top")
        >>> # why not using "top = Topology("./data/HP36.top")"?
        """
        self = Topology(filename)

    def copy(self, *args):
        """return a copy of 'self' or copy from 'other' to 'self'
        TODO : add more doc
        """
        cdef Topology tmp
        cdef Topology other

        if not args:
            # make a copy of 'self'
            tmp = Topology()
            tmp.thisptr[0] = self.thisptr[0]
            return tmp
        elif isinstance(args[0], Topology):
            # copy other Topology instance to "self"
            # no error? really?
            other = args[0]
            self.thisptr[0] = other.thisptr[0]

    def __getitem__(self, int idx):
        """
        return Atom instance

        TODO : return either atoms or residues 

                Example : 
                    self['atom'], self['residue'] 
                        return list of Atom instances or Residue instances

                    self[0] 
                        return 0-th Atom instance
        END TODO
        """

        cdef Atom atom = Atom()
        atom.thisptr[0] = self.thisptr.index_opr(idx)
        return atom

    @property
    def atoms(self):
        cdef Atom atom
        cdef atom_iterator it

        it = self.thisptr.begin()
        while it != self.thisptr.end():
            atom = Atom()
            atom.thisptr[0] = deref(it)
            yield atom
            incr(it)

    @property
    def residues(self):
        cdef Residue res
        cdef res_iterator it
        it = self.thisptr.ResStart()

        while it != self.thisptr.ResEnd():
            res = Residue()
            res.thisptr[0] = deref(it)
            yield res
            incr(it)
        
    @property
    def mols(self):
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

    @property
    def atomlist(self):
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

    @property
    def residuelist(self):
        reslist = []
        for res in self.residues:
            reslist.append(res)
        return reslist

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
        cdef FileName filename = FileName()
        filename.thisptr[0] = self.thisptr.OriginalFilename()
        return filename

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

    property n_repdims:
        def __get__(self):
            return self.thisptr.NrepDims()

    property parm_name:
        def __get__(self):
            return self.thisptr.ParmName()
        def __set__(self, name):
            # TODO : check
            self.thisptr.SetParmName(name, FileName().thisptr[0])

    property GB_radiiset:
        def __get__(self):
            return self.thisptr.GBradiiSet()

    #def int SetAmberExtra(self, vector[double], vector[NameType], vector[int], vector[int]):

    def set_integer_mask(self, AtomMask atm, Frame frame=Frame()):
        if frame.is_empty():
            return self.thisptr.SetupIntegerMask(atm.thisptr[0])
        else:
            return self.thisptr.SetupIntegerMask(atm.thisptr[0], frame.thisptr[0])

    def set_char_mask(self, AtomMask atm, Frame frame=Frame()):
        if frame.is_empty():
            return self.thisptr.SetupCharMask(atm.thisptr[0])
        else:
            return self.thisptr.SetupCharMask(atm.thisptr[0], frame.thisptr[0])

    def scale_dihedral_k(self, double value):
        self.thisptr.ScaleDihedralK(value)

    def set_box(self, Box boxin):
        self.thisptr.SetBox(boxin.thisptr[0])

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

    def strip_atoms(Topology self, string mask):
        """strip atoms with given mask"""
        cdef AtomMask atm = AtomMask()
        cdef Topology tmptop = Topology()

        atm.thisptr.SetMaskString(mask)
        atm.thisptr.InvertMask()
        self.thisptr.SetupIntegerMask(atm.thisptr[0])
        tmptop.thisptr = self.thisptr.modifyStateByMask(atm.thisptr[0])
        self.thisptr[0] = tmptop.thisptr[0]

    #def write_AmberParm(self, name):
    #    Parm_Amber().write_parm(name, self)

    def tag(self):
        return self.thisptr.Tag()

    def is_empty(self):
        s = self.file_path()
        return s == ""
