# distutils: language = c++
from .cpptraj_dict import GridModeDict, get_key


cdef class GridAction:
    def __cinit__(self):
        self.thisptr = new _GridAction()

    def __dealloc__(self):
        del self.thisptr

    #def DataSet_GridFlt * GridInit(self, char *, ArgList arglis, DataSetList dslist, FrameList flist):

    def GridInfo(self, DataSet_GridFlt dset_gf):
        self.thisptr.GridInfo(dset_gf.thisptr[0])

    def int GridSetup(self, Topology top):
        return self.thisptr.GridSetup(top.thisptr[0])

    def  void GridFrame(self, Frame frame, AtomMask atm, DataSet_GridFlt dset_gf):
        self.thisptr.GridFrame(frame.thisptr[0], atm.thisptr[0], dset_gf.thisptr[0])

    def GridMode(self):
        return get_key(self.thisptr.GridMode(), GridModeDict)

    def CenterMask(self):
        cdef AtomMask atm = AtomMask()
        atm.thisptr[0] = self.thisptr.CenterMask()

    def Increment(self):
        return self.thisptr.Increment()

