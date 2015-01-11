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
    Add new action: add to pycpptraj/actions/ folder 
                    then update action in pycpptraj/actions/allactions
                    (TODO : allactions.py might be changed)
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
        Parameters
        ----------
        command : str
            Type of actions, mask, ... (Get help: Action_Box().help())
        top : Topology or TopologyList instance, default=TopologyList()
        flist : FrameList instance, default=FrameList()
        dslist : DataSetList instance, default=DataSetList()
        dflist : DataFileList instance, default=DataFileList()
        debug : int, default=0
            debug option from cpptraj. (Do we need this?)
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

    def process(self, Topology currenttop, Topology newtop=Topology()): 
        """
        Process input and do initial setup
        (TODO : add more doc)

        Parameters:
        ----------
        currenttop : Topology instance, default (no default)
        newtop : new Topology instance, default=Topology()
            Need to provide this instance if you want to change topology
        """
        if "Strip" in self.__class__.__name__:
            # since `Action_Strip` will copy a modified version of `currenttop` and 
            # store in newtop, then __dealloc__ (from cpptraj)
            # we need to see py_free_mem to False
            newtop.py_free_mem = False
        return self.baseptr.Setup(currenttop.thisptr, &(newtop.thisptr))

    def do_action(self, int idx=0, Frame oldframe=Frame(), Frame newframe=Frame()):
        """
        Perform action on Frame. Depend on what action you want to perform, you might get
        newframe or get data from dslist or dflist...
        TODO : add FrameArray
        Parameters:
        ----------
        idx : int, defaul=0 
            id of Frame
        current_frame : Frame instance need to be processed, default=Frame() 
        newframe : Frame instance, defaul=Frame()
            if action change Frame, you need to have this
        >>> from pycpptraj._cast import cast_dataset
        >>> # dslist is DataSetList (list of DataSet instance)
        >>> d0 = cast_dataset(dslist[0], dtype='DataSet_double')
        """
        # debug
        oldframe.py_free_mem = newframe.py_free_mem = False
        #oldframe.py_free_mem = False
        # got double-free memory error when not using above flag
        # end debug
        #return self.baseptr.DoAction(idx, oldframe.thisptr, &(newframe.thisptr))
        self.baseptr.DoAction(idx, oldframe.thisptr, &(newframe.thisptr))

    def print_output(self):
        """Do we need this?"""
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
