# distutils: language = c++
from DispatchObject cimport *
from ArgList cimport *
from DataFileList cimport *
from DataSetList cimport *
from FrameList cimport *
from TopologyList cimport *


cdef extern from "Action.h" namespace "Action": 
    # Action.h
    ctypedef enum RetType "Action::RetType":
        aOK "Action::OK"
        aERR "Action::ERR"
        aUSEORIGINALFRAME "Action::USEORIGINALFRAME"
        aSUPPRESSCOORDOUTPUT "Action::SUPPRESSCOORDOUTPUT"
    cdef cppclass Action "Action":
        pass
