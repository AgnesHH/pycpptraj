# distutils: language = c++


cdef class Atom:
    def __cinit__(self):
        self.thisptr = new _Atom()

    def __dealloc__(self):
        del self.thisptr

    #def Atom(self):

    #def Atom(self, NameType, char, char *):

    #def Atom(self, NameType, NameType, double):

    #def Atom(self, NameType, double, double, NameType):

    #def Atom(self, NameType, double, double, int, double, int, NameType, double, double):

    # def Atom(self, Atom):

    def swap(self,Atom at1, Atom at2):
        self.thisptr.swap(at1.thisptr[0], at2.thisptr[0])

    #def  bond_iterator bondbegin(self):

    #def  bond_iterator bondend(self):

    #def  excluded_iterator excludedbegin(self):

    #def  excluded_iterator excludedend(self):

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
    
    property GBradius:
        def __set__(self,double rin):
            self.thisptr.SetGBradius(rin)
        def __get__(self):
            return self.thisptr.GBRadius()

    def no_mol(self):
        return self.thisptr.NoMol()

    def c_str(self):
        return self.thisptr.c_str()

    @property
    def element(self):
        return self.thisptr.Element()

    @property
    def atomic_number(self):
        return self.thisptr.AtomicNumber()

    @property
    def element_name(self):
        return self.thisptr.ElementName()

    def name(self):
        cdef NameType nt = NameType()
        nt.thisptr[0] = self.thisptr.Name()
        return nt

    @property
    def type(self):
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
    def chain_i_d(self):
        return self.thisptr.ChainID()

    @property
    def nbonds(self):
        return self.thisptr.Nbonds()

    @property
    def nexcluded(self):
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

    #def add_exclusion_list(self,set[int] intset):
    #    self.thisptr.AddExclusionList(intset)

    def get_bond_length(self,AtomicElementType id1, AtomicElementType id2):
        return self.thisptr.GetBondLength(id1, id2)
