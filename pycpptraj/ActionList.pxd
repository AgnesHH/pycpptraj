# distutil: language = c++

from libcpp.string cimport string
from pycpptraj.DispatchObject cimport _DispatchObject, DispatchObject, DispatchAllocatorType
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.TopologyList cimport _TopologyList, TopologyList
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.FrameList cimport _FrameList, FrameList
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.DataFileList cimport _DataFileList, DataFileList
from pycpptraj.FrameArray cimport FrameArray
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj._FunctPtr cimport FunctPtr
from pycpptraj.AtomMask cimport _AtomMask, AtomMask
from pycpptraj.CpptrajFile cimport _CpptrajFile, CpptrajFile

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
