# distutil: language = c++

from Topology cimport *
from ArgList cimport *

cdef extern from "ReferenceFrame.h":
    cdef cppclass _ReferenceFrame "ReferenceFrame":
        _ReferenceFrame()
        _ReferenceFrame(int)
        _Frame* Coord()
        _Topology* Parm()
        bint error()
        bint empty()
        const _FileName& FrameName()
        const string& Tag()
        int LoadRef(const string&, _Topology*, int)
        int LoadRef(const string&, _ArgList&, _Topology*, int)
        int StripRef(const string&)
        int StripRef(const _AtomMask&)
        void RefInfo()
