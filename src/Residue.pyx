# distutils: language = c++


cdef class Residue:
    def __cinit__(self):
        self.thisptr = new _Residue()

    def __dealloc__(self):
        del self.thisptr

    #def Residue(self,int onum, NameType resname, int firstAtomIn):

    #def  void SetLastAtom(self,int i):

    #def  void SetOriginalNum(self,int i):

    #def  int FirstAtom(self):

    #def  int LastAtom(self):

    #def  int OriginalResNum(self):

    #def  char * c_str(self):

    #def  NameType Name(self):

    #def  int NumAtoms(self):

    #def  bint NameIsSolvent(self):

