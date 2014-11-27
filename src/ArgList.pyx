# distutils: language = c++

from vector_pycpptraj cimport vector as cppvector
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr

cdef class ArgList:
    def __cinit__(self, *args):
        # TODO: need to read cpptraj code for construtor
        cdef string  sinput
        cdef char* sep
        cdef ArgList rhs

        if not args:
            self.thisptr = new _ArgList()
        else:
            if len(args) == 1:
                if isinstance(args[0], ArgList):
                    rhs = args[0]
                    self.thisptr = new _ArgList(rhs.thisptr[0])
                elif isinstance(args[0], basestring):
                    sinput = args[0]
                    self.thisptr = new _ArgList(sinput)
                else:
                    raise ValueError()
            elif len(args) == 2:
                sinput, sep = args
                self.thisptr = new _ArgList(sinput, sep)
            else:
                raise ValueError()

    def __dealloc__(self):
        del self.thisptr

    def __iter__(self):
        cdef cppvector[string].const_iterator it
        #cdef string s_out
        it = self.thisptr.begin()
        while it != self.thisptr.end():
            yield deref(it)
            incr(it)

    @classmethod
    def copy(cls, ArgList rhs):
        cdef ArgList arglist = ArgList()
        del arglist.thisptr
        arglist.thisptr = new _ArgList(rhs.thisptr[0])
        return arglist

    def __getitem__(ArgList self, idx):
        return self.thisptr[0][idx]

    def ClearList(self):
        self.thisptr.ClearList()

    def SetList(self, string inputString, char* separator):
        return self.thisptr.SetList(inputString, separator)
    
    def RemainingArgs(self):
        cdef ArgList remain = ArgList()
        remain.thisptr[0] = self.thisptr.RemainingArgs()
        return remain

    def AddArg(self, string minput):
        self.thisptr.AddArg(minput)

    def List(self):
        return self.thisptr.List()

    @property
    def Nargs(self):
        return self.thisptr.Nargs()

    def empty(self):
        return self.thisptr.empty()

    def ArgLine(self):
        return self.thisptr.ArgLine()

    def MarkArg(self, int arg):
        self.thisptr.MarkArg(arg)

    def CheckForMoreArgs(self):
        return self.thisptr.CheckForMoreArgs()

    def PrintList(self):
        self.thisptr.PrintList()

    def PrintDebug(self):
        self.thisptr.PrintDebug()

    def RemoveFirstArg(self):
        self.thisptr.RemoveFirstArg()

    def Command(self):
        # got segmentfault when calling this function
        # thisptr.Command() return pointer to 1st arg
        return self.thisptr.Command()

    def CommandIs(self, char* cm):
        return self.thisptr.CommandIs(cm)
    
    def GetStringNext(self):
        return self.thisptr.GetStringNext()

    def GetStringKey(self, char* c):
        return self.thisptr.GetStringKey(c)

    def GetMaskNext(self):
        return self.thisptr.GetMaskNext()

    def getNextTag(self):
        return self.thisptr.getNextTag()

    def getNextInteger(self, defint):
        return self.thisptr.getNextInteger(defint)

    def getNextDouble(self, double defd):
        return self.thisptr.getNextDouble(defd)

    def getKeyInt(self, char* key, int defint):
        return self.thisptr.getKeyInt(key, defint)

    def getKeyDouble(self, char* key, double defd):
        return self.thisptr.getKeyDouble(key, defd)

    def hasKey(self, char* key):
        return self.thisptr.hasKey(key)

    def Contains(self, char* key):
        return self.thisptr.Contains(key)

    # those methods exist in ArgList.h but don't in ArgList.cpp 
    # in cpptraj
    #def ValidInteger(self, int idx):
    #    return self.thisptr.ValidInteger(idx)

    #def IntegerAt(self, int idx):
    #    return self.thisptr.IntegerAt(idx)

    #def ValidDouble(self, int idx):
    #    return self.thisptr.ValidDouble(idx)
