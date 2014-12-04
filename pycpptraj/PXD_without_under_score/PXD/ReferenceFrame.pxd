# distutils: language = c++
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *


cdef extern from "ReferenceFrame.h": 
    cdef cppclass ReferenceFrame "ReferenceFrame":
        ReferenceFrame() 
        ReferenceFrame(int)
        #~ReferenceFrame() 
        Frame * Coord() const 
        Topology * Parm() const 
        bint error() const 
        bint empty() const 
        const FileName& FrameName() const 
        const string& Tag() const 
        int LoadRef(const string&, Topology *, int)
        int LoadRef(const string&, ArgList&, Topology *, int)
        int StripRef(const string&)
        int StripRef(const AtomMask&)
        void RefInfo() const 
