# distutils: language = c++


cdef class CpptrajFile:

    def __cinit__(self, *args):
        cdef CpptrajFile cfile
        if not args:
            self.thisptr = new _CpptrajFile()
        else:
            if isinstance(args[0], CpptrajFile):
                cfile = args[0]
                self.thisptr = new _CpptrajFile(cfile.thisptr[0])

    def __dealloc__(self):
        del self.thisptr

    @classmethod
    # TODO: make better method's name
    def typedict(cls, tdict='AccessType'):
        # Aim: support for enum in cpptraj

        AccessType = {
                READ : "READ",
                WRITE : "WRITE",
                APPEND : "APPEND",
                UPDATE : "UPDATE",
        }
            # CpptrajFile.h
        CompressType = {
                NO_COMPRESSION : "NO_COMPRESSION",
                GZIP : "GZIP",
                BZIP2 : "BZIP2",
                ZIP : "ZIP",
        }
            # CpptrajFile.h
        FileType = {
                UNKNOWN_TYPE : "UNKNOWN_TYPE",
                STANDARD : "STANDARD",
                GZIPFILE : "GZIPFILE",
                BZIP2FILE : "BZIP2FILE",
                ZIPFILE : "ZIPFILE",
                MPIFILE : "MPIFILE",
        }
        if tdict == 'AccessType':
            return AccessType
        elif tdict == 'CompressType':
            return CompressType
        elif tdict == 'FileType':
            return FileType
        else:
            raise NotImplementedError()

    def OpenRead(self, string nameIn):
        cdef bint sucess
        cdef int result
        result = self.thisptr.OpenRead(nameIn)
        if result == 0:
            sucess = True
        else:
            sucess = False
        return sucess

    def SetupRead(self, string nameIn, int debugIn):
        return self.thisptr.SetupRead(nameIn, debugIn)

    def OpenWriteNumbered(self, int numIn):
        return self.thisptr.OpenWriteNumbered(numIn)

    def OpenWrite(self, string nameIn):
        return self.thisptr.OpenWrite(nameIn)

    def OpenEnsembleWrite(self, string nameIn, int debugIn):
        return self.thisptr.OpenEnsembleWrite(nameIn, debugIn)

    def SetupWrite(self, *args):
        cdef string fname
        cdef FileType ftype
        cdef int debugIn

        if len(args) == 3:
            fname, ftype, debugIn = args
            return self.thisptr.SetupWrite(fname, ftype, debugIn)
        elif len(args) == 2:
            fname, debugIn = args
            return self.thisptr.SetupWrite(fname, debugIn)
        else:
            raise ValueError()
           
    def OpenAppend(self, string nameIn):
        return self.thisptr.OpenAppend(nameIn)

    def OpenEnsembleAppend(self, string nameIn, int debugIn):
        return self.thisptr.OpenEnsembleAppend(nameIn, debugIn)

    def SetupAppend(self, string nameIn, int debugIn):
        return self.thisptr.SetupAppend(nameIn, debugIn)

    def OpenFile(self, *args):
        cdef AccessType accessIn
        if not args:
            return self.thisptr.OpenFile()
        else:
            accessIn =args[0]
            return self.thisptr.OpenFile(accessIn)
        
    def CloseFile(self):
        self.thisptr.CloseFile()

    #def Printf(self, char * formart, *args):
    #    self.thisptr.Printf(formart, *args)

    def GetLine(self):
        return self.thisptr.GetLine()

    def NextLine(self):
        # return char*
        return self.thisptr.NextLine()

    def Access(self):
        return self.thisptr.Access()

    def Compression(self):
        return self.thisptr.Compression()

    def IsOpen(self):
        return self.thisptr.IsOpen()

    def Filename(self):
        cdef FileName fname = FileName()
        fname.thisptr[0] = self.thisptr.Filename()
        return fname

    def FileSize(self):
        return self.thisptr.FileSize()

    def IsCompressed(self):
        return self.thisptr.IsCompressed()

    def UncompressedSize(self):
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
