# distutils: language = c++


cdef class Action:
    def __cinit__(self):
        # don't directly create instance of this ABC class.
        pass
        #self.thisptr = new _Action()

    def __dealloc__(self):
        del self.thisptr

    def Init(self, ArgList argIn, TopologyList toplist, FrameList flist, DataSetList dslist, DataFileList dflist, int debug):
        return self.thisptr.Init(argIn.thisptr[0], toplist.thisptr, flist.thisptr, dslist.thisptr, dflist.thisptr,
                debug)

    #def Setup(_Topology *, _Topology * *):
    #    pass

    #def Do_Action(int, _Frame *, _Frame * *):
    #    pass
