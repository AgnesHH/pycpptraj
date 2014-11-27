# distutils: language = c++


cdef class Molecule:
    def __cinit__(self):
        self.thisptr = new _Molecule()

    def __dealloc__(self):
        del self.thisptr

    #def Molecule(self):

    #def Molecule(self,int begin, int end):

    #def void SetFirst(self,int begin):

    #def void SetLast(self,int last):

    #def void SetSolvent(self):

    #def void SetNoSolvent(self):

    #def  int BeginAtom(self):

    #def  int EndAtom(self):

    #def  bint IsSolvent(self):

    #def  int NumAtoms(self):

