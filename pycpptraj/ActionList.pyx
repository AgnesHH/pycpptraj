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

    def clear(self):
        self.thisptr.Clear()

    def set_debug(self,int debug):
        self.thisptr.SetDebug(debug)

    # where?
    #def SetSilent(self,bint b):
    #    self.thisptr.SetSilent(b)

    def debug(self):
        return self.thisptr.Debug()

    def add_action(self, FunctPtr func, ArgList arglist, TopologyList toplist, 
                         FrameList flist, DataSetList dlist, DataFileList dflist):
        """
        Add action to ActionList

        Parameters:
        ==========
        func :: FunctPtr instance, holding function pointer
        arglist :: ArgList instance
        toplist :: TopologyList instance
        flist :: FrameList instance
        dlist :: DataSetList 
        dflist :: DataFileList
        """

        # add function pointer: How?
        return self.thisptr.AddAction(func.ptr, arglist.thisptr[0], 
                                      toplist.thisptr, flist.thisptr, 
                                      dlist.thisptr, dflist.thisptr)
    #def int SetupActions(self,Topology **):
    #def bint DoActions(self,Frame **, int):

    def print_list(self):
        self.thisptr.Print()

    def list(self):
        self.thisptr.List()

    def empty(self):
        return self.thisptr.Empty()

    def n_actions(self):
        return self.thisptr.Naction()

    def cmd_string(self,int i):
        return self.thisptr.CmdString(i)

    def action_alloc(self, int i):
        # return func_ptr
        cdef FunctPtr func = FunctPtr()
        func.ptr = self.thisptr.ActionAlloc(i)
        return func
