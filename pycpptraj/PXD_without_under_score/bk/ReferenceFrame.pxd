# distutils: language = c++
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *


cdef extern from "ReferenceFrame.h": 
    cdef cppclass ReferenceFrame "ReferenceFrame":
        ReferenceFrame() : frame_(0 ), parm_(0 ), num_(0 ), strippedParm_(false)
        ReferenceFrame(int): frame_(0 ), parm_(0 ), num_(- 1 ), strippedParm_(false)
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
