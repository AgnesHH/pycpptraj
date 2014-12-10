# distutils: language = c++
from libcpp.vector cimport vector


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
                elif isinstance(args[0], AtomMask):
                    rhs_atm = args[0]
                    self.thisptr = new _AtomMask(rhs_atm.thisptr[0])
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
        if self.thisptr != NULL:
            del self.thisptr

    def  Selected(self):
        return self.thisptr.Selected()

    #def _iterator begin(self):
    #def _iterator end(self):
    def __iter__(self):
        # Not yet supported
        raise NotImplementedError()

    def back(self):
        return self.thisptr.back()

    def Nselected(self):
        return self.thisptr.Nselected()

    #def  int operator[](self,int idx):
    def __getitem__(self, int idx):
        return self.thisptr.index_opr(idx)

    def MaskString(self):
        return self.thisptr.MaskString()

    def MaskExpression(self):
        return self.thisptr.MaskExpression()

    def MaskStringSet(self):
        return self.thisptr.MaskStringSet()

    def None(self):
        return self.thisptr.None()

    def IsCharMask(self):
        return self.thisptr.IsCharMask()

    def ResetMask(self):
        self.thisptr.ResetMask()

    def ClearSelected(self):
        self.thisptr.ClearSelected()

    def InvertMask(self):
        self.thisptr.InvertMask()

    def NumAtomsInCommon(self, AtomMask other_mask):
        return self.thisptr.NumAtomsInCommon(other_mask.thisptr[0])

    def AddSelectedAtom(self,int i):
        self.thisptr.AddSelectedAtom(i)

    def AddAtom(self,int atom_num):
        self.thisptr.AddAtom(atom_num)

    def AddAtoms(self, vector[int] v):
        self.thisptr.AddAtoms(v)

    def AddAtomRange(self, int begin, int end):
        self.thisptr.AddAtomRange(begin, end)

    def AddMaskAtPosition(self, AtomMask atm, int pos):
        self.thisptr.AddMaskAtPosition(atm.thisptr[0], pos)

    def PrintMaskAtoms(self, char* mask):
        self.thisptr.PrintMaskAtoms(mask)

    def SetMaskString(self, char* mask):
        return self.thisptr.SetMaskString(mask)

    def SetupIntMask(self, char *charmask, int natom, int debug=0):
        self.thisptr.SetupIntMask(charmask, natom, debug)

    def SetupCharMask(self, char* charmask, int natom, int debug=0):
        self.thisptr.SetupCharMask(charmask, natom, debug)

    def AtomsInCharMask(self, *args):
        cdef atomid, begin, end
        if len(args) == 1:
            atomid = args[0]
            return self.thisptr.AtomInCharMask(atomid)
        elif len(args) == 2:
            begin, end = args
            return self.thisptr.AtomsInCharMask(begin, end)

    def SetNatom(self,int a):
        self.thisptr.SetNatom(a)

    def ConvertToCharMask(self):
        return self.thisptr.ConvertToCharMask()

    def ConvertToIntMask(self):
        return self.thisptr.ConvertToIntMask()

    def MaskInfo(self):
        self.thisptr.MaskInfo()

    def BriefMaskInfo(self):
        self.thisptr.BriefMaskInfo()

    # Not yet support
    #def  token_iterator begintoken(self):
    #def  token_iterator endtoken(self):

