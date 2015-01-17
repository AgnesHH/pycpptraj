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

    def __str__(self):
        return self.thisptr.c_str()

    def set_last_atom(self,int i):
        self.thisptr.SetLastAtom(i)

    def set_original_num(self,int i):
        self.thisptr.SetOriginalNum(i)

    @property
    def first_atom(self):
        return self.thisptr.FirstAtom()

    @property
    def last_atom(self):
        return self.thisptr.LastAtom()

    @property
    def original_res_num(self):
        return self.thisptr.OriginalResNum()

    def parm_name(self):
        # TODO: return char*
        return self.thisptr.c_str()

    def ntype(self):
        cdef NameType nt = NameType()
        nt.thisptr[0] = self.thisptr.Name()
        return nt

    @property
    def n_atoms(self):
        return self.thisptr.NumAtoms()

    def name_is_solvent(self):
        return self.thisptr.NameIsSolvent()

