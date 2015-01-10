# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.DispatchObject cimport _DispatchObject, DispatchObject
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.DataFileList cimport _DataFileList, DataFileList
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.FrameList cimport _FrameList, FrameList
from pycpptraj.TopologyList cimport _TopologyList, TopologyList
from pycpptraj._FunctPtr cimport FunctPtr
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.FrameArray cimport FrameArray

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
        RetType DoAction(int, _Frame *, _Frame * *)
        void Print() 


cdef class Action:
    cdef _Action* baseptr
