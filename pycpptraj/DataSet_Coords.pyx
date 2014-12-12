# distutils: language = c++
from DataSet cimport DataSet


cdef class DataSet_Coords(DataSet_1D):
    def __cinit__(self):
        # abstract class, dont' create new object here
        #self.thisptr = new _DataSet_Coords()
        pass

    def __dealloc__(self):
        # abstract class
        pass
        #if self.thisptr is not NULL:
        #    del self.thisptr

    #def DataSet_Coords(self,DataSet:
    #        pass

    def allocate_frame(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = (<_DataSet_Coords*>self.thisptr).AllocateFrame()
        return frame

    def set_topology(self, Topology top):
        (<_DataSet_Coords*>self.thisptr).SetTopology(top.thisptr[0])

    @property
    def top(self):
        cdef Topology top = Topology()
        top.thisptr[0] = (<_DataSet_Coords*>self.thisptr).Top()
        return top


