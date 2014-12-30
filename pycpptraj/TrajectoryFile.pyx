# distutils: language = c++


cdef class TrajectoryFile:
    """
    Original cpptraj doc:
    ====================
    Base class that all input and output trajectories will inherit.
    There are 3 steps to adding new trajectory types:
      - 1) Create the TrajectoryIO-derived class for the format and include
           it in TrajectoryFile.cpp.
      - 2) Add a unique entry to enumerated type TrajFormatType.
      - 3) Add entry/entries describing how the format is to be called
           to the TF_AllocArray[] and TF_KeyArray[] arrays.

    doc for pycpptraj:
    ================
    Class hierarchy:
    TrajectoryFile --> Trajin --> Trajin_Single
    """

    def __cinit__(self):
        # ABC
        self.topology = Topology()

        # let cpptraj free memory for self.topology
        self.topology.py_free_mem = False

        # we don't need to initialize self.topology here
        # check "property" section
        # set memory view for self.topology.thisptr
        #if self.baseptr0.TrajParm():
        #    self.topology.thisptr = self.baseptr0.TrajParm()

    def __dealloc__(self):
        # ABC
        pass

    def read_options(self):
        self.baseptr0.ReadOptions()

    def write_options(self):
        self.baseptr0.WriteOptions()

    def get_format_from_arg(self,ArgList arglist):
        return self.baseptr0.GetFormatFromArg(arglist.thisptr[0])

    def get_format_from_string(self, string s):
        return self.baseptr0.GetFormatFromString(s)

    def get_extension_for_type(self,TrajFormatType t):
        return self.baseptr0.GetExtensionForType(t)

    def get_type_from_extension(self, string e):
        return self.baseptr0.GetTypeFromExtension(e)

    def format_string(self,TrajFormatType tt):
        return self.baseptr0.FormatString(tt)

    def set_debug(self,int debug=0):
        self.baseptr0.SetDebug(debug)

    def set_trajfilename(self, string fname, bint is_read=True):
        self.baseptr0.SetTrajFileName(fname, is_read)

    # this decorator does not work
    # Python complains that 'property' is not callable
    # check the below solution
    #@property
    #def top(self):
    #    self.topology.thisptr = self.baseptr0.TrajParm()
    #    return self.topology

    #@top.setter
    #def top(self, Topology other):
    #    self.baseptr0.SetTrajParm(other.thisptr)

    property top:
        def __get__(self):
            self.topology.thisptr = self.baseptr0.TrajParm()
            return self.topology

        def __set__(self, Topology other):
            self.baseptr0.SetTrajParm(other.thisptr)
        
    # don't need this method. use "top" property
    #def set_traj_parm(self,Topology top):
    #    return self.baseptr0.SetTrajParm(top.thisptr)

    # don't need this method. use "top" property
    #def traj_parm(self):
    #    cdef Topology top = Topology()
    #    top.thisptr[0] = self.baseptr0.TrajParm()[0]
    #    return top

    def trajfilename(self):
        cdef FileName fname = FileName()
        if not fname.thisptr:
            raise MemoryError("Can not get Filename instance")
        fname.thisptr[0] = self.baseptr0.TrajFilename()
        return fname
