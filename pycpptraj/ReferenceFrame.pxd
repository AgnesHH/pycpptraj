# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *


cdef extern from "ReferenceFrame.h": 
    cdef cppclass _ReferenceFrame "ReferenceFrame":
        _Reference_Frame() 
        _Reference_Frame(int)
        #~_Reference_Frame() 
        const _Frame& Coord() const 
        const _Topology& Parm() const 
        bint error() const 
        bint empty() const 
        const _FileName& FrameName() const 
        const string& Tag() const 
        int LoadRef(const string&, _Topology *, int)
        int LoadRef(const string&, _ArgList&, _Topology *, const string&, int)
        int StripRef(const _AtomMask&)
        void RefInfo() const 
        void ClearRef() 


cdef class ReferenceFrame:
    cdef _ReferenceFrame* thisptr

