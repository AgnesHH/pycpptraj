# distutils: language = c++
from DataSet cimport DataSet


cdef class DataSet_Coords(DataSet_1D):
    def __cinit__(self):
        # abstract class, dont' create new object here
        #pass
        # make sure that two pointers pointing to the same address
        self.baseptr0 = <_DataSet*> self.baseptr_2
        self.baseptr_1 = <_DataSet_1D*> self.baseptr_2

    def __dealloc__(self):
        # abstract class
        pass

    def allocate_frame(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.baseptr_2.AllocateFrame()
        return frame

    def set_topology(self, Topology top):
        self.baseptr_2.SetTopology(top.thisptr[0])

    @property
    def top(self):
        cdef Topology top = Topology()
        top.thisptr[0] = self.baseptr_2.Top()
        return top

    # TODO: add more virtual methods

 
