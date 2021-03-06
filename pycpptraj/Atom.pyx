# distutils: language = c++
from pycpptraj.cpptraj_dict import get_key, AtomicElementDict

cdef class Atom:
#    def __cinit__(self, aname="", atype=None, index=0, 
#                        chainID=' ', resnum=0, mol=0,
#                        charge=0.0, polar=0.0, mass=1.0, 
#                        element=None,
#                        *args, **kwd):
    def __cinit__(self, *args, **kwd):
        # TODO : add more constructors
        cdef NameType aname, atype
        if not args and not kwd:
            self.thisptr = new _Atom()
        else:
            if len(args) == 2:
                if isinstance(args[0], basestring) and isinstance(args[1], basestring):
                    aname = NameType(args[0])
                    atype = NameType (args[1])
                    self.thisptr = new _Atom(aname.thisptr[0], atype.thisptr[0], 1.0) 
            else:
                raise NotImplementedError("not yet supported")

    def __dealloc__(self):
        del self.thisptr

    def copy(self):
        cdef Atom atom = Atom()
        del atom.thisptr
        atom.thisptr = new _Atom(self.thisptr[0])
        return atom

    #def Atom(self):

    #def Atom(self, NameType, char, char *):

    #def Atom(self, NameType, NameType, double):

    #def Atom(self, NameType, double, double, NameType):

    #def Atom(self, NameType, double, double, int, double, int, NameType, double, double):

    # def Atom(self, Atom):

    def swap(self, Atom at1, Atom at2):
        self.thisptr.swap(at1.thisptr[0], at2.thisptr[0])

    #def  bond_iterator bondbegin(self):
    #def  bond_iterator bondend(self):
    def bond_iter(self):
        pass

    #def  excluded_iterator excludedbegin(self):
    #def  excluded_iterator excludedend(self):
    def excluded_iter(self):
        pass

    property resnum:
        def __set__(self, int resnumIn):
            self.thisptr.SetResNum(resnumIn)
        def __get__(self):
            return self.thisptr.ResNum()

    property mol:
        def __set__(self,int molIn):
            self.thisptr.SetMol(molIn)

    property charge:
        def __set__(self,double qin):
            self.thisptr.SetCharge(qin)
        def __get__(self):
            return self.thisptr.Charge()
    
    property gb_radius:
        # Do we need this?
        def __set__(self,double rin):
            self.thisptr.SetGBradius(rin)
        def __get__(self):
            return self.thisptr.GBRadius()

    def no_mol(self):
        return self.thisptr.NoMol()

    def __str__(self):
        txt = "Atom object with name %s " % self.thisptr.c_str()
        return txt

    def __repr__(self):
        txt = "<Atom object: %s>" % self.thisptr.c_str()
        return txt

    @property
    def element(self):
        return get_key(self.thisptr.Element(), AtomicElementDict)

    @property
    def atomic_number(self):
        return self.thisptr.AtomicNumber()

    @property
    def element_short_name(self):
        """why method name is not short at all? :D"""
        return self.thisptr.ElementName()

    def nametype(self):
        # TODO : do we need this method?
        cdef NameType nt = NameType()
        nt.thisptr[0] = self.thisptr.Name()
        return nt

    @property
    def name(self):
        # TODO : do we need this method?
        return self.thisptr.c_str()

    @property
    def atype(self):
        cdef NameType nt = NameType()
        nt.thisptr[0] = self.thisptr.Type()
        return nt

    @property
    def typeindex(self):
        return self.thisptr.TypeIndex()

    @property
    def molnum(self):
        return self.thisptr.MolNum()

    @property 
    def chainID(self):
        return self.thisptr.ChainID()

    @property
    def n_bonds(self):
        return self.thisptr.Nbonds()

    @property
    def n_excluded(self):
        return self.thisptr.Nexcluded()

    @property
    def mass(self):
        return self.thisptr.Mass()

    @property
    def polar(self):
        return self.thisptr.Polar()

    @property
    def screen(self):
        return self.thisptr.Screen()

    def add_bond(self,int idx):
        self.thisptr.AddBond(idx)

    def clear_bonds(self):
        self.thisptr.ClearBonds()

    def sort_bonds(self):
        self.thisptr.SortBonds()

    def is_bonded_to(self, int idx):
        # TODO : add doc
        return self.thisptr.IsBondedTo(idx)

    #def add_exclusion_list(self, list[int] intset):
    #    cdef set[int] tmp = intset
    #    self.thisptr.AddExclusionList(intset)

    @classmethod
    def get_bond_length(cls, id1, id2):
        """get_bond_length(id1, id2)
        Return : bond length of two atomic elements (Angstrom)

        Parameters:
        ---------
        id1 : str, AtomicElement 1
        id2 : str, AtomicElement 2
        """
        id1 = id1.upper()
        id2 = id2.upper()
        return _Atom.GetBondLength(AtomicElementDict[id1], 
                                          AtomicElementDict[id2])

    @classmethod
    def get_all_atomic_elements(cls):
        """return a list of all atomic_elements, class method"""
        return AtomicElementDict.keys()
