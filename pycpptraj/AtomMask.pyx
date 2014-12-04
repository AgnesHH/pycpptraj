# distutils: language = c++


cdef class AtomMask:
    def __cinit__(self):
        self.thisptr = new _AtomMask()

    def __dealloc__(self):
       del self.thisptr

    #def AtomMask(self):

    #def AtomMask(self, string):

    #def AtomMask(self,int, int):

    #def AtomMask(self,int):

    #def AtomMask(self, AtomMask):

    #def  vector[int] Selected(self):

    #def _iterator begin(self):

    #def _iterator end(self):

    #def int back(self):

    #def int Nselected(self):

    #def  int operator[](self,int idx):

    #def  char * MaskString(self):

    #def  string MaskExpression(self):

    #def bint MaskStringSet(self):

    #def bint None(self):

    #def bint IsCharMask(self):

    #def void ResetMask(self):

    #def void ClearSelected(self):

    #def void InvertMask(self):

    #def int NumAtomsInCommon(self, AtomMask):

    #def void AddSelectedAtom(self,int i):

    #def void AddAtom(self,int):

    #def void AddAtoms(self, vector[int]):

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

