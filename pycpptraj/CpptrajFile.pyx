# distutils: language = c++


cdef class CpptrajFile:
    """
    Original cpptraj doc:
    Class to abstract handling of basic file routines.
    """
    def __cinit__(self, *args):
        cdef CpptrajFile cfile
        if not args:
            self.thisptr = new _CpptrajFile()
        else:
            if isinstance(args[0], CpptrajFile):
                cfile = args[0]
                self.thisptr = new _CpptrajFile(cfile.thisptr[0])

    def __dealloc__(self):
        """ This is virtual method"""
        #del self.thisptr
        pass

    def open_read(self, string fname):
        cdef bint sucess
        cdef int result
        result = self.thisptr.OpenRead(fname)
        if result == 0:
            sucess = True
        else:
            sucess = False
        return sucess

    def setup_read(self, string fname, int debug):
        return self.thisptr.SetupRead(fname, debug)

    def open_write_numbered(self, int numIn):
        return self.thisptr.OpenWriteNumbered(numIn)

    def open_write(self, string fname):
        return self.thisptr.OpenWrite(fname)

    def open_ensemble_write(self, string fname, int debug):
        return self.thisptr.OpenEnsembleWrite(fname, debug)

    def setup_write(self, *args):
        cdef string fname
        cdef FileType ftype
        cdef int debug

        if len(args) == 3:
            fname, ftype, debug = args
            return self.thisptr.SetupWrite(fname, ftype, debug)
        elif len(args) == 2:
            fname, debug = args
            return self.thisptr.SetupWrite(fname, debug)
        else:
            raise ValueError()
           
    def open_append(self, string fname):
        return self.thisptr.OpenAppend(fname)

    def open_ensemble_append(self, string fname, int debug):
        return self.thisptr.OpenEnsembleAppend(fname, debug)

    def setup_append(self, string fname, int debug):
        return self.thisptr.SetupAppend(fname, debug)

    def open_file(self, *args):
        cdef AccessType accessIn
        if not args:
            return self.thisptr.OpenFile()
        else:
            accessIn =args[0]
            return self.thisptr.OpenFile(accessIn)
        
    def close_file(self):
        self.thisptr.CloseFile()

    # How to wrap Printf(char*, ...) C++ function in Cython?
    # Explicitly put args?
    #def Printf(self, char * formart, *args):
    #    self.thisptr.Printf(formart, *args)

    def get_line(self):
        return self.thisptr.GetLine()

    def next_line(self):
        # return char*
        return self.thisptr.NextLine()

    def access(self):
        return self.thisptr.Access()

    def compression(self):
        return self.thisptr.Compression()

    def is_open(self):
        return self.thisptr.IsOpen()

    def filename(self):
        cdef FileName fname = FileName()
        fname.thisptr[0] = self.thisptr.Filename()
        return fname

    def file_size(self):
        return self.thisptr.FileSize()

    def is_compressed(self):
        return self.thisptr.IsCompressed()

    def uncompressed_size(self):
        return self.thisptr.UncompressedSize()

    # STATUS: NOT WORK RIGHT YET
    #def Read(self, int size):
    #    cdef char* magic
    #    cdef int status
    #    status = self.thisptr.Read(&magic, size)
    #    return magic, status

    #def Read(self, char* dummy='', int size):
    #    cdef char* magic2
    #    cdef int status
    #    status = self.thisptr.Read(magic, size)
    #    dummy = magic
    #    return magic2, status
