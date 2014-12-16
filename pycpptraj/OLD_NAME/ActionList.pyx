# distutils: language = c++
from FusedType cimport FusedAction
from FunctPtr cimport FunctPtr
from cython.operator cimport dereference as deref

# Do we really need this class in Python?
cdef class ActionList:
    def __cinit__(self):
        self.thisptr = new _ActionList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def SetDebug(self,int debug):
        self.thisptr.SetDebug(debug)

    # where?
    #def SetSilent(self,bint b):
    #    self.thisptr.SetSilent(b)

    def Debug(self):
        return self.thisptr.Debug()

    #def AddAction(self,DispatchObject dispatch_oject, ArgList arglist, TopologyList toplist, 
    #                       FrameList flist, DataSetList dlist, DataFileList dflist):
    cdef AddAction(self, FusedAction action, ArgList arglist, TopologyList toplist, 
                           FrameList flist, DataSetList dlist, DataFileList dflist):

        # add function pointer: How?
        cdef DispatchAllocatorType func_ptr
        func_ptr = &(action.Alloc)
        return self.thisptr.AddAction(func_ptr, arglist.thisptr[0], 
                                      toplist.thisptr, flist.thisptr, 
                                      dlist.thisptr, dflist.thisptr)

    def AddAction_test(self, FunctPtr func, ArgList arglist, TopologyList toplist, 
                           FrameList flist, DataSetList dlist, DataFileList dflist):

        # add function pointer: How?
        return self.thisptr.AddAction(func.ptr, arglist.thisptr[0], 
                                      toplist.thisptr, flist.thisptr, 
                                      dlist.thisptr, dflist.thisptr)
    #def int SetupActions(self,Topology **):
    #def bint DoActions(self,Frame **, int):

    def Print(self):
        self.thisptr.Print()

    def List(self):
        self.thisptr.List()

    def Empty(self):
        return self.thisptr.Empty()

    def Naction(self):
        return self.thisptr.Naction()

    def CmdString(self,int i):
        return self.thisptr.CmdString(i)

    cdef DispatchAllocatorType ActionAlloc(self,int i):
        # return func_ptr
        return self.thisptr.ActionAlloc(i)
