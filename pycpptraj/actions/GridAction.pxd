# distutils: language = c++
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.FrameList cimport _FrameList, FrameList
from pycpptraj.datasets.DataSet_GridFlt cimport _DataSet_GridFlt, DataSet_GridFlt
from pycpptraj.Frame cimport _Frame, Frame
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.AtomMask cimport _AtomMask, AtomMask
from pycpptraj.Topology cimport _Topology, Topology


cdef extern from "GridAction.h": 
    # GridAction.h
    ctypedef enum GridModeType "GridAction::GridModeType":
        ORIGIN "GridAction::ORIGIN"
        BOX "GridAction::BOX"
        MASKCENTER "GridAction::MASKCENTER"
        SPECIFIEDCENTER "GridAction::SPECIFIEDCENTER"
    cdef cppclass _GridAction "GridAction":
        Grid_Action() 
        _DataSet_GridFlt * GridInit(const char *, _ArgList&, _DataSetList&, const _FrameList&)
        void GridInfo(const _DataSet_GridFlt&)
        int GridSetup(const _Topology&)
        inline void GridFrame(const _Frame&, const _AtomMask&, _DataSet_GridFlt&)
        GridModeType GridMode() const 
        const _AtomMask& CenterMask() const 
        float Increment() const 


cdef class GridAction:
    cdef _GridAction* thisptr

