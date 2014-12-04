# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Trajin cimport Trajin


cdef class TrajinList:
    def __cinit__(self):
        self.thisptr = new _TrajinList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def SetDebug(self,int dIn):
        self.thisptr.SetDebug(dIn)

    def AddTrajin(self, string s, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddTrajin(s, arglist.thisptr[0], toplist.thisptr[0])

    def AddEnsemble(self, string s, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddEnsemble(s, arglist.thisptr[0], toplist.thisptr[0])

    def __iter__(self):
        cdef Trajin trajin
        cdef cppvector[_Trajin*].const_iterator it
        it = self.thisptr.begin()
        while it != self.thisptr.end():
            trajin = Trajin()
            trajin.thisptr = deref(it)
            yield trajin
            incr(it)

    def empty(self):
        return self.thisptr.empty()

    def Mode(self):
        return self.thisptr.Mode()

    #def  Trajin * front(self):

    @property
    def MaxFrames(self):
        return self.thisptr.MaxFrames()

    def List(self):
        self.thisptr.List()
