# distutils: language = c++
from ..DispatchObject cimport *
from ..ArgList cimport *
from ..DataFileList cimport *
from ..DataSetList cimport *
from ..FrameList cimport *
from ..TopologyList cimport *


cdef extern from "Action.h": 
    # Action.h
    ctypedef enum RetType "Action::RetType":
        OK "Action::OK"
        ERR "Action::ERR"
        USEORIGINALFRAME "Action::USEORIGINALFRAME"
        SUPPRESSCOORDOUTPUT "Action::SUPPRESSCOORDOUTPUT"
    cdef cppclass _Action "Action":
        #virtual ~_Action() 
        RetType Init(_ArgList&, _TopologyList *, _FrameList *, _DataSetList *, _DataFileList *, int)
        RetType Setup(_Topology *, _Topology * *)
        RetType Do_Action(int, _Frame *, _Frame * *)
        void Print() 


cdef class Action:
    cdef _Action* thisptr
