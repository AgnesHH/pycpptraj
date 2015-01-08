# distutils: language = c++
from pycpptraj.cpptraj_dict import TrajFormatDict, get_key

cdef class TrajectoryFile:
    """
    Base class that all input and output trajectories will inherit.

    Class hierarchy:
    TrajectoryFile --> Trajin --> Trajin_Single
    """

    def __cinit__(self):
        # ABC
        self._top = Topology()

        # let cpptraj free memory for self._top
        self._top.py_free_mem = False

        # we don't need to initialize self._top here
        # check "property" section
        # set memory view for self._top.thisptr
        #if self.baseptr0.TrajParm():
        #    self._top.thisptr = self.baseptr0.TrajParm()

    def __dealloc__(self):
        # ABC
        pass

    def read_options(self):
        self.baseptr0.ReadOptions()

    def write_options(self):
        self.baseptr0.WriteOptions()

    def get_format(self, arg):
        """
        Return format
        Parameters
        ---------
        arg : ArgList instance or string
        """
        cdef ArgList arglist
        cdef string s
        if isinstance(arg, ArgList):
            arglist = <ArgList> arg
            return self.baseptr0.GetFormatFromArg(arglist.thisptr[0])
        elif isinstance(arg, basestring):
            s = arg
            return self.baseptr0.GetFormatFromString(s)

    def get_ext_for_type(self, string key):
        """
        Parameters
        ----------
        value : str
        """
        return self.baseptr0.GetExtensionForType(TrajFormatDict[key])

    def get_type_from_ext(self, string e):
        """
        Parameters
        ----------
        value : str
        """
        ttype = self.baseptr0.GetTypeFromExtension(e)
        return get_key(ttype, TrajFormatDict)

    def format_string(self, string key):
        return self.baseptr0.FormatString(TrajFormatDict[key])

    def set_debug(self, int debug=0):
        self.baseptr0.SetDebug(debug)

    def set_trajfilename(self, string fname, bint is_read=True):
        self.baseptr0.SetTrajFileName(fname, is_read)

    # this decorator does not work
    # Python complains that 'property' is not callable
    # check the below solution
    #@property
    #def top(self):
    #    self._top.thisptr = self.baseptr0.TrajParm()
    #    return self._top

    #@top.setter
    #def top(self, Topology other):
    #    self.baseptr0.SetTrajParm(other.thisptr)

    property top:
        def __get__(self):
            if not self._top.is_empty():
                self._top.thisptr = self.baseptr0.TrajParm()
            return self._top

        def __set__(self, Topology other):
            # make a copy
            cdef Topology newtop = other.copy()
            # since we will pass a pointer to SetTrajParm method,
            # we let cpptraj frees memory
            newtop.py_free_mem = False

            self.baseptr0.SetTrajParm(newtop.thisptr)
            self._top.thisptr = self.baseptr0.TrajParm()

    def trajfilename(self):
        cdef FileName fname = FileName()
        if not fname.thisptr:
            raise MemoryError("Can not get Filename instance")
        fname.thisptr[0] = self.baseptr0.TrajFilename()
        return fname