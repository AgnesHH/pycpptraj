# distutil: language = c++

from DispatchObject cimport *
from Topology cimport *
from TopologyList cimport *
from FrameList cimport *
from DataSetList cimport *
from DataFileList cimport *

cdef extern from "ActionList.h":
    cdef cppclass _ActionList "ActionList":
        _ActionList()
        void Clear()
        void SetDebug(int)
        int Debug()
        int AddAction(DispatchAllocatorType, _ArgList&,
                      _TopologyList*, _FrameList*,
                      _DataSetList*, _DataFileList*)
        int SetupActions(_Topology**)
        bint DoActions(_Frame **, int)
        void Print()
        void List()
        bint Empty()
        int Naction()
        const string& CmdString(int)
        DispatchAllocatorType ActionAlloc(int i)

cdef class ActionList:
    cdef _ActionList* thisptr
    #cdef AddAction(self, FusedAction action, ArgList arglist, TopologyList toplist,
    #               FrameList flist, DataSetList dlist, DataFileList dflist)
    #cdef DispatchAllocatorType ActionAlloc(self,int i)
