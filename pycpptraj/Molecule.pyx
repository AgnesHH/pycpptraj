# distutils: language = c++

cdef class Molecule:
    def __cinit__(self, *args):
        cdef int beginidx, endidx
        if not args:
            self.thisptr = new _Molecule()
        elif len(args) == 2:
            beginidx, endidx = args
            self.thisptr = new _Molecule(beginidx, endidx)
        else:
            raise ValueError("Must have None or 2 integers")

    def __dealloc__(self):
        del self.thisptr

    def SetFirst(self,int begin):
        self.thisptr.SetFirst(begin)

    def SetLast(self,int last):
        self.thisptr.SetLast(last)

    def SetSolvent(self):
        self.thisptr.SetSolvent()

    def SetNoSolvent(self):
        self.thisptr.SetNoSolvent()

    @property
    def BeginAtom(self):
        return self.thisptr.BeginAtom()

    @property
    def EndAtom(self):
        return self.thisptr.EndAtom()

    def IsSolvent(self):
        return self.thisptr.IsSolvent()

    @property
    def NumAtoms(self):
        return self.thisptr.NumAtoms()

