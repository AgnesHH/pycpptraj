# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_CheckStructure.h": 
    cdef cppclass _Action_CheckStructure "Action_CheckStructure":
        _Action_CheckStructure()
        _DispatchObject* Alloc()
        void Help()
        RetType Init(_ArgList&, _TopologyList*, _FrameList*, _DataSetList*,
                     _DataFileList*, int)
        RetType Setup(_Topology*, _Topology**)
        int CheckFrame(int, const _Frame&)
        void Print()
