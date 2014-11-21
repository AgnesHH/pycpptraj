# distutils: language = c++
from ArgList cimport *
from DataSetList cimport *
from DataSet_GridFlt cimport *
from Topology cimport *


cdef extern from "GridAction.h": 
    # GridAction.h
    ctypedef enum GridModeType "GridAction::GridModeType":
        ORIGIN "GridAction::ORIGIN"
        BOX "GridAction::BOX"
        MASKCENTER "GridAction::MASKCENTER"
        SPECIFIEDCENTER "GridAction::SPECIFIEDCENTER"
    cdef cppclass GridAction "GridAction":
        GridAction() : increment_(1.0)
        DataSet_GridFlt * GridInit(const char *, ArgList&, DataSetList&)
        void GridInfo(const DataSet_GridFlt&)
        int GridSetup(const Topology&)
        inline void GridFrame(const Frame&, const AtomMask&, DataSet_GridFlt&)
        GridModeType GridMode() const 
        const AtomMask& CenterMask() const 
        float Increment() const 
