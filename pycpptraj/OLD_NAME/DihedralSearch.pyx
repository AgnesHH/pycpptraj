# distutils: language = c++


cdef class DihedralSearch:
    def __cinit__(self):
        self.thisptr = new _DihedralSearch()

    def __dealloc__(self):
        del self.thisptr

    #def mask_it begin(self):
    #def mask_it end(self):

    def Ndihedrals(self):
        return self.thisptr.Ndihedrals()

    def ListKnownTypes(self):
        self.thisptr.ListKnownTypes()

    def OffsetHelp(self):
        self.thisptr.OffsetHelp()

    def DihedralType GetType(self, string typein):
        return self.thisptr.GetType(typein)

    def SearchFor(self, DihedralType dhtype):
        return self.thisptr.SearchFor(dhtype)

    def SearchForArgs(self, ArgList arglist):
        self.thisptr.SearchForArgs(arglist.thisptr[0])

    def SearchForNewType(self, int off, string an0, string an1, string an2, string an3, string name):
        return self.SearchForNewType(off, an0, an1, an2, an3, name)

    def SearchForAll(self):
        return self.thisptr.SearchForAll()

    def FindDihedrals(self, Topology, Range):
        return self.thisptr.FindDihedrals(top.thisptr[0], r.thisptr[0])

    def Clear(self):
        self.thisptr.Clear()

    def ClearFound(self):
        self.thisptr.ClearFound()

    def PrintTypes(self):
        self.thisptr.PrintTypes()

    def MovingAtoms(self, Topology, int atom0, int atom1):
        cdef AtomMask atm = AtomMask()
        atm.thisptr[0] = self.thisptr.MovingAtoms(top.thisptr[0],atom0, atom1)
        return atm

