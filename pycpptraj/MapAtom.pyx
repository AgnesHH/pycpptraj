# distutils: language = c++


cdef class MapAtom:
    def __cinit__(self, *args):
        cdef Atom atom
        cdef MapAtom map_atom

        if not args:
            self.thisptr = new _MapAtom()
        elif len(args) == 1:
            if isinstance(args[0], Atom):
                atom = args[0]
                self.thisptr = new _MapAtom(atom.thisptr[0])
            elif isinstance(args[0], MapAtom):
                map_atom = args[0]
                self.thisptr = new _MapAtom(map_atom.thisptr[0])
            else:
                raise ValueError()
        else:
            raise ValueError()

    @classmethod
    def copy(cls, MapAtom other):
        cdef MapAtom matom = MapAtom()
        matom.thisptr[0] = other.thisptr[0]
        return matom

    def is_chiral(self):
        return self.thisptr.IsChiral()

    def bound_to_chiral(self):
        return self.thisptr.BoundToChiral()

    def is_mapped(self):
        return self.thisptr.IsMapped()

    def complete(self):
        return self.thisptr.Complete()

    def is_unique(self):
        return self.thisptr.IsUnique()

    def unique(self):
        return self.thisptr.Unique()

    def n_duplicated(self):
        return self.thisptr.Nduplicated()

    def char_name(self):
        return self.thisptr.CharName()

    def is_duplicated(self):
        self.thisptr.IsDuplicated()

    def set_mapped(self):
        self.thisptr.SetMapped()

    def set_complete(self):
        self.thisptr.SetComplete()

    def set_chiral(self):
        self.thisptr.SetChiral()

    def set_bound_to_chiral(self):
        self.thisptr.SetBoundToChiral()

    def set_atom_i_d(self, string s):
        self.thisptr.SetAtomID(s)

    def set_unique(self, string s):
        self.thisptr.SetUnique(s)

    def set_not_mapped(self):
        self.thisptr.SetNotMapped()

    def set_not_complete(self):
        self.thisptr.SetNotComplete()

    def set_not_chiral(self):
        self.thisptr.SetNotChiral()
