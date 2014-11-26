# distutils: language = c++
from Topology cimport Topology
from ArgList cimport ArgList


cdef class TopologyList:
    def __cinit__(self):
        self.thisptr = new _TopologyList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def SetDebug(self,int id):
        self.thisptr.SetDebug(id)

    def GetParm_test(self, int idx):
        cdef Topology top = Topology()
        top.thisptr = self.thisptr.GetParm(idx)
        return top

    #def Topology * GetParm(self,int):
    # make sure to return correct topology
    def GetParm(self, arg):
        cdef Topology top = Topology()
        cdef int num
        cdef ArgList argIn
        if isinstance(arg, int):
            num = arg
            top.thisptr = self.thisptr.GetParm(num)
        if isinstance(arg, ArgList):
            argIn = arg
            top.thisptr = self.thisptr.GetParm(argIn.thisptr[0])
        return top

    #def Topology * GetParmByIndex(self,ArgList):
    def GetParmByIndex(self, ArgList argIn):
        cdef Topology top = Topology()
        top.thisptr = self.thisptr.GetParmByIndex(argIn.thisptr[0])
        return top

    def AddParmFile(self, *args):
        cdef string fname
        cdef ArgList arglist
        if len(args) == 1:
            fname = args[0]
            return self.thisptr.AddParmFile(fname)
        elif len(args) == 2:
            fname, arglist = args
            return self.thisptr.AddParmFile(fname, arglist.thisptr[0])
        
    def List(self):
        self.thisptr.List()

