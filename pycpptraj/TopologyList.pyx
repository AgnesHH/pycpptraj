# distutils: language = c++
from cython.operator cimport dereference as deref
from Topology cimport Topology
from ArgList cimport ArgList


cdef class TopologyList:
    def __cinit__(self, *args):
        cdef string fname
        self.thisptr = new _TopologyList()
        if args:
            fname = args[0]
            self.add_parm_file(fname)

    def __dealloc__(self):
        if self.thisptr is not NULL:
            #print "delete ", self.__class__
            del self.thisptr

    def clear(self):
        self.thisptr.Clear()

    def set_debug(self,int id):
        self.thisptr.SetDebug(id)

    def __getitem__(self, int idx):
        try:
           return self.get_parm(idx)
        except:
            raise ValueError("index is out of range? do you have empty list?")

    #def Topology * GetParm(self,int):
    # make sure to return correct topology
    def get_parm(self, arg):
        cdef Topology top = Topology()
        cdef int num
        cdef ArgList argIn

        if isinstance(arg, (int, long)):
            num = arg
            top.thisptr[0] = deref(self.thisptr.GetParm(num))
        if isinstance(arg, ArgList):
            argIn = arg
            top.thisptr[0] = deref(self.thisptr.GetParm(argIn.thisptr[0]))
        return top

    #def Topology * GetParmByIndex(self,ArgList):
    def get_parm_by_index(self, ArgList argIn):
        cdef Topology top = Topology()
        top.thisptr = self.thisptr.GetParmByIndex(argIn.thisptr[0])
        return top

    def add_parm_file(self, *args):
        cdef string fname
        cdef ArgList arglist
        if len(args) == 1:
            fname = args[0]
            return self.thisptr.AddParmFile(fname)
        elif len(args) == 2:
            fname, arglist = args
            return self.thisptr.AddParmFile(fname, arglist.thisptr[0])
        
    def info(self):
        self.thisptr.List()
