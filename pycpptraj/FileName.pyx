# distutils: language = c++

cdef class FileName:

    def __cinit__(self, myname=''):
        self.thisptr = new _FileName()
        self.thisptr.SetFileName(myname)

    def __dealloc__(self):
        del self.thisptr

    def __str__(self):
        fname = self.Full()
        fname = fname.split("/")[-1]
        return fname

    def set_filename(self, mystring):
        self.thisptr.SetFileName(mystring)

    def set_filename_with_expansion(self, mystring):
        self.thisptr.SetFileNameWithExpansion(mystring)
    
    def clear(self):
        self.thisptr.clear()

    def match_full_or_base(self, mystring):
        return self.thisptr.MatchFullOrBase(mystring)

    @property
    def full_name(self):
        return self.thisptr.Full()

    @property
    def base(self):
        return self.thisptr.Base()

    property ext:
        def __get__(self):
            return self.Ext()

    def empty(self):
        return self.thisptr.empty()

    @property
    def compress(self):
        return self.thisptr.Compress()

    def dir_prefix(self):
        return self.thisptr.DirPrefix()
