# distutils: language = c++


cdef class AtomMap:
    def __cinit__(self):
        self.thisptr = new _AtomMap()

    def __dealloc__(self):
        del self.thisptr

    #def MapAtom operator[](self,int):

    #def  MapAtom operator[](self,int i):

    #def int Natom(self):

    #def void SetDebug(self,int d):

    #def int Setup(self, Topology):

    #def int SetupResidue(self, Topology, int):

    #def void ResetMapping(self):

    #def bint BondIsRepeated(self,int, int):

    #def void DetermineAtomIDs(self):

    #def void MarkAtomComplete(self,int, bint):

    #def void CheckForCompleteAtoms(self):

    #def int SymmetricAtoms(self, Topology, AtomIndexArray, int):

