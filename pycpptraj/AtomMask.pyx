# distutils: language = c++


cdef class AtomMask:
    def __cinit__(self, *args):
        cdef int begin_atom, end_atom, atom_num
        cdef string maskstring
        cdef AtomMask rhs_atm
        if not args:
            self.thisptr = new _AtomMask()
        else:
            if len(args) == 1:
                if isinstance(args[0], basestring):
                    maskstring = args[0]
                    self.thisptr = new _AtomMask(maskstring)
                if isinstance(args[0], AtomMask):
                    rhs_atm = args[0]
                    self.thisptr = new _AtomMask(rhs_atm)
                else:
                    atom_num = args[0]
                    self.thisptr = new _AtomMask(atom_num)
            elif len(args) == 2:
                begin_atom, end_atom = args
                self.thisptr = new _AtomMask(begin_atom, end_atom)
            else:
                # TODO: better Error
                raise NotImplementedError()

    def __dealloc__(self):
       del self.thisptr

    def  vector[int] Selected(self):
        return self.thisptr.Selected()


    #def _iterator begin(self):

    #def _iterator end(self):

    def int back(self):
        return self.thisptr.back()

    def int Nselected(self):
        return self.thisptr.Nselected()

    #def  int operator[](self,int idx):
    def __getitem__(self, int idx):
        return self.thisptr.index_opr(idx)

    def  char * MaskString(self):
        return self.thisptr.MaskString()

    def  string MaskExpression(self):
        return self.thisptr.MaskExpression()

    def bint MaskStringSet(self):
        return self.thisptr.MaskStringSet()

    def bint None(self):
        return self.thisptr.None()

    def bint IsCharMask(self):
        return self.thisptr.IsCharMask()


    def void ResetMask(self):
        self.thisptr.ResetMask()

    def void ClearSelected(self):
        self.thisptr.ClearSelected()

    def void InvertMask(self):
        self.thisptr.InvertMask()

    def int NumAtomsInCommon(self, AtomMask other_mask):
        return self.thisptr.NumAtomsInCommon(other_mask.thisptr[0])

    def void AddSelectedAtom(self,int i):
        self.thisptr.args(i)

    def void AddAtom(self,int):
        self.thisptr.AddAtom(atom_num)

    def void AddAtoms(self, vector[int]):
        self.thisptr.AddAtoms()

    #def void AddAtomRange(self,int, int):

    #def void AddMaskAtPosition(self, AtomMask, int):

    #def void PrintMaskAtoms(self, char *):

    #def int SetMaskString(self, char *):

    #def int SetMaskString(self, string):

    #def void SetupIntMask(self, char *, int, int):

    #def void SetupCharMask(self, char *, int, int):

    #def bint AtomInCharMask(self,int):

    #def bint AtomsInCharMask(self,int, int):

    #def void SetNatom(self,int a):

    #def int ConvertToCharMask(self):

    #def int ConvertToIntMask(self):

    #def void MaskInfo(self):

    #def void BriefMaskInfo(self):

    #def  token_iterator begintoken(self):

    #def  token_iterator endtoken(self):

