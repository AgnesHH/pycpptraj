# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class CpptrajState:
    """
    Original cpptraj doc:
    ====================

    pycpptraj doc:
    ============
    """
    def __cinit__(self):
        self.thisptr = new _CpptrajState()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    @property
    def toplist(self):
        """return TopologyList"""
        cdef TopologyList toplist = TopologyList()
        toplist.thisptr[0] = deref(self.thisptr.PFL())
        return toplist

    @property
    def framelist(self):
        """return FrameList"""
        cdef FrameList flist = FrameList()
        flist.thisptr[0] = deref(self.thisptr.FL())
        return flist

    @property
    def datasetlist(self):
        """return DataSetList"""
        cdef DataSetList dlist = DataSetList()
        dlist.thisptr[0] = deref(self.thisptr.DSL())
        return dlist

    @property
    def datafilelist(self):
        """return DataFileList"""
        cdef DataFileList dflist = DataFileList()
        dflist.thisptr[0] = deref(self.thisptr.DFL())
        return dflist

    def set_no_exit_on_error(self):
        self.thisptr.SetNoExitOnError()

    def set_no_progress(self):
        self.thisptr.SetNoProgress()

    def debug(self):
        return self.thisptr.Debug()

    def exit_on_error(self):
        return self.thisptr.ExitOnError()

    def empty_state(self):
        return self.thisptr.EmptyState()

    def add_trajin(self, arg, isEnsemble=False):
        cdef string fname
        cdef ArgList argIn
        
        if isinstance(arg, ArgList):
            argIn = arg
            self.thisptr.AddTrajin(argIn.thisptr[0], isEnsemble)
        elif isinstance(arg, basestring):
            fname = arg
            self.thisptr.AddTrajin(fname)
        else:
            raise NotImplementedError()

    def run_analyses(self):
        return self.thisptr.RunAnalyses()

    @property
    def trajlist(self):
        cdef TrajinList trajlist = TrajinList()
        trajlist.thisptr[0] = self.thisptr.InputTrajList()
        return trajlist

    def add_trajout(self, arg):
        cdef string fname
        cdef ArgList arglist

        if isinstance(arg, ArgList):
            arglist = arg
            return self.thisptr.AddTrajout(arglist.thisptr[0])
        elif isinstance(arg, basestring):
            fname = arg
            return self.thisptr.AddTrajout(fname)
        else:
            raise NotImplementedError()

    def add_reference(self, arg):
        cdef string name
        cdef ArgList arglist

        if isinstance(arg, str):
            name = arg
            self.thisptr.AddReference(name)
        elif isinstance(arg, ArgList):
            arglist = arg
            self.thisptr.AddReference(arglist.thisptr[0])
        else:
            raise NotImplementedError()

    def add_action(self, obj, ArgList arglist):
        # need to explicit casting to FunctPtr because self.thisptr.AddAction need to know type 
        # of variables
        cdef FunctPtr alloc_funct = <FunctPtr> obj.alloc()
        return self.thisptr.AddAction(alloc_funct.ptr, arglist.thisptr[0])

    def add_analysis(self, obj, ArgList arglist):
        """temp doc: add_analysis(self, obj, ArgList arglist)
        obj :: Action or Analysis instance
        >>> obj = Action_Rmsd()
        """
        cdef FunctPtr alloc_funct = <FunctPtr> obj.alloc()
        return self.thisptr.AddAnalysis(alloc_funct.ptr, arglist.thisptr[0])

    # what is it?
    def world_size(self):
        return self.thisptr.WorldSize()

    def list_all(self, ArgList arglist):
        return self.thisptr.ListAll(arglist.thisptr[0])

    def set_list_debug(self, ArgList arglist):
        return self.thisptr.SetListDebug(arglist.thisptr[0])

    def clear_list(self, ArgList arglist):
        return self.thisptr.ClearList(arglist.thisptr[0])

    def remove_data_set(self, ArgList alist):
        return self.thisptr.RemoveDataSet(alist.thisptr[0])

    def traj_length(self, string topname, vector[string] trajlist):
        return self.thisptr.TrajLength(topname, trajlist)

    def run(self):
        return self.thisptr.Run()

    def master_data_file_write(self):
        self.thisptr.MasterDataFileWrite()
