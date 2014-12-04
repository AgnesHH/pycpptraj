# distutils: language = c++


cdef class MapAtom:
    def __cinit__(self):
        self.thisptr = new _MapAtom()

    def MapAtom(self):
        pass

    # def MapAtom(self, MapAtom):

    def MapAtom(self, Atom):
        pass

    @classmethod
    def copy(cls, MapAtom):
        pass

    def copy(self, MapAtom other):
        """copy data from "other"""
        pass

    def IsChiral(self):
        return self.thisptr.IsChiral()

    def BoundToChiral(self):
        return self.thisptr.BoundToChiral()

    def IsMapped(self):
        return self.thisptr.IsMapped()

    def Complete(self):
        return self.thisptr.Complete()

    def IsUnique(self):
        return self.thisptr.IsUnique()

    def Unique(self):
        return self.thisptr.Unique()

    def Nduplicated(self):
        return self.thisptr.Nduplicated()

    def CharName(self):
        return self.thisptr.CharName()

    def IsDuplicated(self):
        self.thisptr.IsDuplicated()

    def SetMapped(self):
        self.thisptr.SetMapped()

    def SetComplete(self):
        self.thisptr.SetComplete()

    def SetChiral(self):
        self.thisptr.SetChiral()

    def SetBoundToChiral(self):
        self.thisptr.SetBoundToChiral()

    def SetAtomID(self, string s):
        self.thisptr.SetAtomID(s)

    def SetUnique(self, string s):
        self.thisptr.SetUnique(s)

    def SetNotMapped(self):
        self.thisptr.SetNotMapped()

    def SetNotComplete(self):
        self.thisptr.SetNotComplete()

    def SetNotChiral(self):
        self.thisptr.SetNotChiral()
