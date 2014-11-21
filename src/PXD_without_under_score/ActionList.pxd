# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "ActionList.h": 
    cdef cppclass ActionList "ActionList":
        ActionList() 
        #~ActionList() 
        void Clear() 
        void SetDebug(int)
        int Debug() const 
        int AddAction(DispatchAllocatorType, ArgList&, TopologyList *, FrameList *, DataSetList *, DataFileList *)
        int SetupActions(Topology * *)
        bint DoActions(Frame * *, int)
        void Print() 
        void List() const 
        bint Empty() const 
        int Naction() const 
        const string& CmdString(int i) const 
        DispatchAllocatorType ActionAlloc(int i) const 
