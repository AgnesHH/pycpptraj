# distutils: language = c++


cdef class ActionList:
    def __cinit__(self):
        self.thisptr = new _ActionList()

    def __dealloc__(self):
        del self.thisptr

    #def ActionList(self):

    #def void Clear(self):

    #def void SetDebug(self,int):

    #def void SetSilent(self,bint b):

    #def int Debug(self):

    #def int AddAction(self,DispatchObject::DispatchAllocatorType, ArgList, TopologyList *, FrameList *, DataSetList *, DataFileList *):

    #def int SetupActions(self,Topology * *):

    #def bint DoActions(self,Frame * *, int):

    #def void Print(self):

    #def void List(self):

    #def bint Empty(self):

    #def int Naction(self):

    #def  string CmdString(self,int i):

    #def DispatchObject::DispatchAllocatorType ActionAlloc(self,int i):

