# distutils: language = c++
from DataSet cimport DataSet


cdef class DataSet_Coords(DataSet_1D):
    def __cinit__(self):
        # abstract class, dont' create new object here
        #pass
        # make sure that two pointers pointing to the same address
        self.baseptr0 = <_DataSet*> self.baseptr_2
        self.baseptr_1 = <_DataSet_1D*> self.baseptr_2
        self._top = Topology()

    def __dealloc__(self):
        # abstract class
        pass

    def allocate_frame(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.baseptr_2.AllocateFrame()
        return frame

    # do we need this method?
    def _set_topology(self, Topology top):
        self.baseptr_2.SetTopology(top.thisptr[0])

    property top:
        def __get__(self):
            self._top.thisptr[0] = self.baseptr_2.Top()
            return self._top

        def __set__(self, Topology other):
            self.baseptr_2.SetTopology(other.thisptr[0])
    # TODO: add more virtual methods?

    def add_frame(self, Frame fIn):
        raise NotImplementedError()

    def append(self, Frame fIn):
        raise NotImplementedError()
