# distutils: language = c++


cdef class TrajectoryFile:
    def __cinit__(self):
        self.thisptr = new _TrajectoryFile()

    def __dealloc__(self):
        del self.thisptr

    def read_options(self):
        self.thisptr.ReadOptions()

    def write_options(self):
        self.thisptr.WriteOptions()

    def get_format_from_arg(self,ArgList a):
        return self.thispt.GetFormatFromArg(a)

    def get_format_from_string(self, string s):
        return self.thispt.GetFormatFromString(s)

    def get_extension_for_type(self,TrajFormatType t):
        return self.thispt.GetExtensionForType(t)

    def get_type_from_extension(self, string e):
        return self.thispt.GetTypeFromExtension(e)

    def format_string(self,TrajFormatType tt):
        return self.thispt.FormatString(tt)

    def set_debug(self,int debug=0):
        self.thispt.SetDebug(debug)

    def set_traj_file_name(self, string fname, bint is_read=True):
        self.thispt.SetTrajFileName(fname, is_read)

    def set_traj_parm(self,Topology top):
        return self.thispt.SetTrajParm(top.thispt[0])

    def traj_parm(self):
        cdef Topology top = Topology()
        top.thispt[0] = self.thispt.TrajParm()[0]
        return top

    def traj_filename(self):
        cdef FileName fname = FileName()
        fname.thispt[0] = self.thispt.TrajFilename()
        return fname
