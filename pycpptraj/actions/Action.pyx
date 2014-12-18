# distutils: language = c++
from ..Topology cimport Topology
from ..Frame cimport Frame


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

    def init(self, ArgList argIn, TopologyList toplist, FrameList flist, DataSetList dslist, DataFileList dflist, int debug):
        return self.baseptr.Init(argIn.thisptr[0], toplist.thisptr, flist.thisptr, dslist.thisptr, dflist.thisptr,
                debug)

    def setup(self, Topology top): 
        return self.baseptr.Setup(top.thisptr, &(top.thisptr))

    def do_action(self, int idx, Frame frame):
        return self.baseptr.DoAction(idx, frame.thisptr, &(frame.thisptr))

    # Do we really need this method?
    @classmethod
    def get_action_from_functptr(cls, FunctPtr funct):
        cdef Action act = Action()
        if funct.ptr() == NULL:
            raise ValueError("NULL pointer")
        act.baseptr = <_Action*> funct.ptr()
        return act
