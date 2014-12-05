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

    def OpenRead(self, string nameIn):
        return self.thisptr.OpenRead(nameIn)

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
