# distutils: language = c++


cdef class Residue:
    def __cinit__(self, *args):
        cdef int onum
        cdef NameType resname
        cdef int firstAtomIn

        if not args:
            self.thisptr = new _Residue()
        else:
            if len(args) == 3:
                onum, resname, firstAtomIn = args
                self.thisptr = new _Residue(onum, resname.thisptr[0], firstAtomIn)

    def __dealloc__(self):
        del self.thisptr

    def SetLastAtom(self,int i):
        self.thisptr.SetLastAtom(i)

    def SetOriginalNum(self,int i):
        self.thisptr.SetOriginalNum(i)

    @property
    def FirstAtom(self):
        return self.thisptr.FirstAtom()

    @property
    def LastAtom(self):
        return self.thisptr.LastAtom()

    @property
    def OriginalResNum(self):
        return self.thisptr.OriginalResNum()

    def char * c_str(self):
        # TODO: 
        return self.thisptr.c_str()

    def NameType Name(self):
        cdef NameType nt = NameType()
        nt.thisptr[0] = self.thisptr.Name()
        return nt

    @property
    def NAtoms(self):
        return self.thisptr.NumAtoms()

    def NameIsSolvent(self):
        return self.thisptr.NameIsSolvent()

