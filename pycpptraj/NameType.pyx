# distutils: language = c++


cdef class NameType:
    def __cinit__(self, *args):
        cdef string s
        cdef NameType rhs
        if not args:
            self.thisptr = new _NameType()
        elif len(args) == 1:
            if isinstance(args[0], basestring):
                s = args[0]
                self.thisptr = new _NameType(s)
            elif isinstance(args[0], NameType):
                rhs = args[0]
                self.thisptr = new _NameType(rhs.thisptr[0])
            else:
                raise ValueError()
        else:
            raise ValueError()

    def __dealloc__(self):
        del self.thisptr

    #def NameType(self, char *):

    def ToBuffer(self,char *c):
        self.thisptr.ToBuffer(c)

    def Match(self, NameType nt):
        """return bool"""
        return self.thisptr.Match(nt.thisptr[00])

    def __richcmp__(NameType self, arg, int opt):
        # better way?
        cdef char* c
        cdef NameType rhs
        if isinstance(arg, basestring):
            c = arg
            if opt == 3:
                # != operator
                return self.thisptr[0] != c
            elif opt == 2:
                # == operator
                return self.thisptr[0] == c
        if isinstance(arg, NameType):
            rhs = arg
            if opt == 3:
                # != operator
                return self.thisptr[0] != rhs.thisptr[0]
            elif opt == 2:
                # == operator
                return self.thisptr[0] == rhs.thisptr[0]

    #def  char * operator *(self):

    def __getitem__(self, int idx):
        return self.thisptr[0][idx]

    def Truncated(self):
        """return string"""
        return self.thisptr.Truncated()

    def ReplaceAsterisk(self):
        self.thisptr.ReplaceAsterisk()
