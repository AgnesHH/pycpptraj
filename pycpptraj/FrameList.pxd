# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.TopologyList cimport _TopologyList, TopologyList
from pycpptraj.ReferenceFrame cimport _ReferenceFrame, ReferenceFrame
from pycpptraj.Frame cimport _Frame, Frame


cdef extern from "FrameList.h": 
    cdef cppclass _FrameList "FrameList":
        _FrameList() 
        #~_FrameList() 
        void Clear() 
        void SetDebug(int)
        _Frame ActiveReference() const 
        int SetActiveRef(int)
        int AddRefFrame(_ArgList&, const _TopologyList&)
        _ReferenceFrame GetFrameFromArgs(_ArgList&) const 
        _ReferenceFrame GetFrameByName(const string&) const 
        void List() const 
        int NumFrames() const 
        const char* RefArgs

cdef class FrameList:
    cdef _FrameList* thisptr
    #cdef const char* info
    cdef bint py_free_mem
