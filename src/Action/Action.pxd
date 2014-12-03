# distutils: language = c++
from DispatchObject cimport *
from ArgList cimport *
from DataFileList cimport *
from DataSetList cimport *
from FrameList cimport *
from TopologyList cimport *


cdef extern from "Action.h": 
    # Action.h
    ctypedef enum RetType "Action::RetType":
        OK "Action::OK"
        ERR "Action::ERR"
        USEORIGINALFRAME "Action::USEORIGINALFRAME"
        SUPPRESSCOORDOUTPUT "Action::SUPPRESSCOORDOUTPUT"
    cdef cppclass _Action "Action":
        pass
