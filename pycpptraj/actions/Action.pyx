# distutils: language = c++


cdef class Action:
    """
    Original cpptraj doc:
    ====================
        The abstract base class that all other actions inherit. 
        By convention actions have 3 main phases: init, Setup, and DoAction.
        Init is used to initialize the action, make sure that all arguments
        for the action are correct, and add any DataSets/DataFiles which will
        be used by the action. Setup will set up the action for a specific
        Topology file. DoAction will perform the action on a given frame.
        A fourth function, Print, is for any additional calculations or output 
        the action may require once all frames are processed.

    pycpptraj doc:
    =============
    Adding get_action_from_functptr
    """
    def __cinit__(self):
        # don't directly create instance of this ABC class.
        pass
        #self.baseptr = new _Action()

    def __dealloc__(self):
        # should I del pointer here or in subclass? 
        #del self.baseptr
        pass

    def read_input(self, command='', top=TopologyList(),
                   FrameList flist=FrameList(), 
                   DataSetList dslist=DataSetList(), 
                   DataFileList dflist=DataFileList(), 
                   int debug=0):
        """
        temp doc: 
        Input: ArgList argIn, TopologyList toplist, FrameList flist, DataSetList dslist, DataFileList dflist, int debug):       
        """
        cdef ArgList arglist
        cdef TopologyList toplist

        if isinstance(top, Topology):
            toplist = TopologyList()
            toplist.add_parm(top)
        elif isinstance(top, TopologyList):
            toplist = <TopologyList> top

        if isinstance(command, basestring):
            arglist = ArgList(<string> command)
        elif isinstance(command, ArgList):
            arglist = <ArgList> command

        return self.baseptr.Init(arglist.thisptr[0], toplist.thisptr, 
                       flist.thisptr, dslist.thisptr, dflist.thisptr,
                       debug)

    def process(self, Topology oldtop, Topology newtop): 
        """
        TODO : rename this method
        Input: 
        ====
        top :: Topology instance
        """
        if "Strip" in self.__class__.__name__:
            # since `Action_Strip` will copy a modified version of `oldtop` and 
            # store in newtop, then __dealloc__ (from cpptraj)
            # we need to see py_free_mem to False
            newtop.py_free_mem = False
        return self.baseptr.Setup(oldtop.thisptr, &(newtop.thisptr))

    def do_action(self, int idx, Frame oldframe=Frame(), Frame newframe=Frame()):
        """
        Input:
        ====
        idx :: frame id
        frame :: Frame instance
        """
        # debug
        oldframe.py_free_mem = newframe.py_free_mem = False
        #oldframe.py_free_mem = False
        # got double-free memory error when not using above flag
        # end debug
        #return self.baseptr.DoAction(idx, oldframe.thisptr, &(newframe.thisptr))
        return self.baseptr.DoAction(idx, oldframe.thisptr, &(newframe.thisptr))

    def do_action_2(self, Frame frame, FrameArray farray=FrameArray(), int idx=0):
        """
        TEST
        Input:
        ====
        idx :: frame id
        frame :: Frame instance
        """
        # debug
        #oldframe.py_free_mem = newframe.py_free_mem = False
        #frame.py_free_mem = False
        # got double-free memory error when not using above flag
        # end debug
        #return self.baseptr.DoAction(idx, oldframe.thisptr, &(newframe.thisptr))
        cdef Frame tmp1 = Frame(frame)
        cdef Frame tmp2 = Frame()

        # need to use this flag to avoid double-free mem
        tmp2.py_free_mem = False

        self.baseptr.DoAction(idx, tmp1.thisptr, &(tmp2.thisptr))
        farray.append(tmp2)

    def print_output(self):
        self.baseptr.Print()

    # Do we really need this method?
    @classmethod
    def get_action_from_functptr(cls, FunctPtr funct):
        cdef Action act = Action()
        if funct.ptr() == NULL:
            raise ValueError("NULL pointer")
        act.baseptr = <_Action*> funct.ptr()
        return act

    #def help(self):
    #    raise NotImplementedError("Abstract Base Class")
