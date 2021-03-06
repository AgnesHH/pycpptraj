# distutils: language = c++
from pycpptraj.utils.six import PY3
from pycpptraj.decorators import makesureABC

if PY3:
    basestring = str

cdef class Analysis:
    """
    Original cpptraj doc:
    ====================
        The abstract base class that all other actions inherit. 
        By convention actions have 3 main phases: init, Setup, and DoAnalysis.
        Init is used to initialize the action, make sure that all arguments
        for the action are correct, and add any DataSets/DataFiles which will
        be used by the action. Setup will set up the action for a specific
        Topology file. DoAnalysis will perform the action on a given frame.
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
        #self.baseptr = new _Analysis()

    def __dealloc__(self):
        # should I del pointer here or in subclass? 
        #del self.baseptr
        pass

    @makesureABC("Analysis")
    def read_input(self, command='', 
                   top=TopologyList(),
                   DataSetList dslist=DataSetList(), 
                   DataFileList dflist=DataFileList(), 
                   int debug=0):
        """
        Parameters
        ----------
        command : str
            Type of actions, mask, ... (Get help: Analysis_Box().help())
        top : Topology or TopologyList instance, default=TopologyList()
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

        return self.baseptr.Setup(arglist.thisptr[0], 
                       dslist.thisptr, 
                       toplist.thisptr,
                       dflist.thisptr,
                       debug)

    @makesureABC("Analysis")
    def do_analysis(self):
        """
        Parameters: None
        """
        self.baseptr.Analyze()
