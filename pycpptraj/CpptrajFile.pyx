# distutils: language = c++
from pycpptraj.cpptraj_dict import AccessDict
from pycpptraj import cpptraj_dict


cdef class CpptrajFile:
    """
    Original cpptraj doc:
    Class to abstract handling of basic file routines.
    """
    def __cinit__(self, *args, **kwd):
        """
        >>> cpptraj = CpptrajFile()
        >>> cpptraj2 = CpptrajFile(cpptraj)
        >>> cpptraj23 = CpptrajFile("test.dat", 'r')
        >>> with CpptrajFile("test2.dat", 'r') as cfile:
        >>>    pass
        """

        cdef CpptrajFile cfile
        if not args and kwd:
            self.thisptr = new _CpptrajFile()
        else:
            if isinstance(args[0], CpptrajFile):
                # ignore other options
                cfile = args[0]
                self.thisptr = new _CpptrajFile(cfile.thisptr[0])
            else:
                self.thisptr = new _CpptrajFile()
                self.open(*args, **kwd)

    def __dealloc__(self):
        """ This is virtual method"""
        #del self.thisptr
        pass

    def __enter__(self):
        return self

    def __exit__(self, arg1, arg2, arg3):
        self.close()

    def open_read(self, string filename):
        cdef bint sucess
        cdef int result
        self.thisptr.OpenRead(filename)

    def _setup_read(self, string filename, int debug):
        return self.thisptr.SetupRead(filename, debug)

    def open_write_numbered(self, int numIn):
        return self.thisptr.OpenWriteNumbered(numIn)

    def open_write(self, string filename):
        return self.thisptr.OpenWrite(filename)

    def open_ensemble_write(self, string filename, int debug):
        return self.thisptr.OpenEnsembleWrite(filename, debug)

    def _setup_write(self, *args):
        cdef string filename
        cdef FileType ftype
        cdef int debug

        if len(args) == 3:
            filename, ftype, debug = args
            return self.thisptr.SetupWrite(filename, ftype, debug)
        elif len(args) == 2:
            filename, debug = args
            return self.thisptr.SetupWrite(filename, debug)
        else:
            raise ValueError()

    def open(self, string filename="", status='r'):
        """just like Python file
        >>> cpptraj = CpptrajFile()
        >>> cpptraj.open("test.dat", 'r')
        """
        status = status.lower()
        if status == 'r' or status == 'read': 
            self.thisptr.OpenRead(filename)
        elif status == 'a' or status == 'append':
            self.thisptr.OpenAppend(filename)
        elif status == 'w' or status == 'write':
            self.thisptr.OpenWrite(filename)
        else:
            raise ValueError("wrong open status")

    def open_append(self, string filename):
        return self.thisptr.OpenAppend(filename)

    def open_ensemble_append(self, string filename, int debug):
        return self.thisptr.OpenEnsembleAppend(filename, debug)

    def _setup_append(self, string filename, int debug):
        return self.thisptr.SetupAppend(filename, debug)

    def openfile(self, *args):
        # TODO : what this method does?
        cdef AccessType accessIn
        if not args:
            return self.thisptr.OpenFile()
        else:
            accessIn =args[0]
            return self.thisptr.OpenFile(accessIn)
        
    def close(self):
        self.thisptr.CloseFile()

    def get_line(self):
        return self.thisptr.GetLine()

    def nextline(self):
        # return char*
        return self.thisptr.NextLine()

    @property
    def mode(self):
        key = cpptraj_dict.get_key(self.thisptr.Access(), AccessDict)
        return key.lower()

    def compression(self):
        return self.thisptr.Compression()

    def is_open(self):
        return self.thisptr.IsOpen()

    def filename(self):
        cdef FileName filename = FileName()
        filename.thisptr[0] = self.thisptr.Filename()
        return filename

    def file_size(self):
        return self.thisptr.FileSize()

    def is_compressed(self):
        return self.thisptr.IsCompressed()

    def uncompressed_size(self):
        return self.thisptr.UncompressedSize()
