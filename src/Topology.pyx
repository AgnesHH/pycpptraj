# distutils: language = c++

from FileName cimport *

cdef class Topology:
    def __cinit__(self):
        self.thisptr = new _Topology()

    def __dealloc__(self):
        del self.thisptr

    def SetOffset(self, double x):
        self.thisptr.SetOffset(x)

    def SetIpol(self, int id):
        pass

    def NextraPts(self):
        pass

    def HasVelInfo(self):
        return self.thisptr.HasVelInfo()

    def OriginalFilename(self):
        cdef FileName fname = FileName()
        fname.thisptr[0] = self.thisptr.OriginalFilename()
        return fname

    property Pindex:
        def __get__(self):
            return self.thisptr.Pindex()

    property Natom:
        def __get__(self):
            return self.thisptr.Natom()

    property Nres:
        def __get__(self):
            return self.thisptr.Nres()

    property Nmol:
        def __get__(self):
            return self.thisptr.Nmol()

    property Nsolvent:
        def __get__(self):
            return self.thisptr.Nsolvent()

    property Nframes:
        def __get__(self):
            return self.thisptr.Nframes()

    property NrepDim:
        def __get__(self):
            return self.thisptr.NrepDim()

    property ParmName:
        def __get__(self):
            return self.thisptr.ParmName()

    property GBradiiSet:
        def __get__(self):
            return self.thisptr.GBradiiSet()

    property NoRefCoords:
        def __get__(self):
            return self.thisptr.NoRefCoords()

    property FinalSoluteRes:
        def __get__(self):
            return self.thisptr.FinalSoluteRes()

    def __iter__(self):
        """Use generator?"""
        pass
    
