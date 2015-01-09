# distutils: language = c++
# distutils: language = c++
from pycpptraj.DispatchObject cimport _DispatchObject, DispatchObject
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.DataFileList cimport _DataFileList, DataFileList
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.FrameList cimport _FrameList, FrameList
from pycpptraj.TopologyList cimport _TopologyList, TopologyList
from pycpptraj._FunctPtr cimport FunctPtr
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.Frame cimport _Frame, Frame


cdef extern from "Analysis.h": 
    # Analysis.h
    ctypedef enum RetType "Analysis::RetType":
        OK "Analysis::OK"
        ERR "Analysis::ERR"
    cdef cppclass _Analysis "Analysis":
        #virtual ~_Analysis() 
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze()


cdef class Analysis:
    cdef _Analysis* baseptr
