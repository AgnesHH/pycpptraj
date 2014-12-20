# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from Array1D cimport *


cdef extern from "Action_FilterByData.h": 
    cdef cppclass _Action_FilterByData "Action_FilterByData" (_Action):
        _Action_FilterByData() 
        _DispatchObject * Alloc() 
        void Help() 
        size_t Determine_Frames() const 
        _Action::RetType Init(_ArgList&, _TopologyList *, _FrameList *, _DataSetList *, _DataFileList *, int)
        _Action::RetType Do_Action(int, _Frame *, _Frame * *)


cdef class Action_FilterByData (Action):
    cdef _Action_FilterByData* thisptr

