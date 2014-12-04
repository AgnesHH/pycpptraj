# distutils: language = c++


cdef class NameType:
    def __cinit__(self, arg):
        cdef string s
        cdef NameType rhs
        if isinstance(arg, basestring):
            s = arg
            self.thisptr = new _NameType(s)
        elif isinstance(arg, NameType):
            rhs = arg
            self.thisptr = new _NameType(rhs.thisptr[0])

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

    #def bint operator ! =(self, char *):

    #def  char * operator *(self):

    #def char operator[](self,int):
    def __getitem__(self, int idx):
        return self.thisptr[0][idx]

    def Truncated(self):
        """return string"""
        return self.thisptr.Truncated()

    def ReplaceAsterisk(self):
        self.thisptr.ReplaceAsterisk()

