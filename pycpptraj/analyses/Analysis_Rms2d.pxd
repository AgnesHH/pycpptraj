# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.analyses.Analysis cimport *
from pycpptraj.datasets.DataSet_2D cimport *
from pycpptraj.datasets.DataSet_Modes cimport *
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


cdef extern from "Analysis_Rms2d.h": 
    cdef cppclass _Analysis_Rms2d "Analysis_Rms2d" (_Analysis):
        _Analysis_Rms2d() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 


cdef class Analysis_Rms2d (Analysis):
    cdef _Analysis_Rms2d* thisptr

