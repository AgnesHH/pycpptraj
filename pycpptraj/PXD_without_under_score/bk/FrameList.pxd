# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from TopologyList cimport *
from ReferenceFrame cimport *


cdef extern from "FrameList.h": 
    cdef cppclass FrameList "FrameList":
        FrameList() 
        #~FrameList() 
        void Clear() 
        void SetDebug(int)
        Frame ActiveReference() const 
        int SetActiveRef(int)
        int AddRefFrame(ArgList&, const TopologyList&)
        ReferenceFrame GetFrameFromArgs(ArgList&) const 
        ReferenceFrame GetFrameByName(const string&) const 
        void List() const 
        int NumFrames() const 
