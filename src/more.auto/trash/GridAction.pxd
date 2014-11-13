# distutils: language = c++
from ArgList cimport *
from DataSetList cimport *
from DataSet_GridFlt cimport *
from Topology cimport *


cdef extern from "GridAction.h": 
    cdef cpplass _GridAction "GridAction":
        Grid_Action() : increment_(1.0)
        _DataSet_GridFlt * GridInit(const char *, _ArgList &, _DataSetList &)
        void GridInfo(_DataSet_const GridFlt&)
        int GridSetup(const _Topology&)
        inline void Grid_Frame(const _Frame&, const _AtomMask&, _DataSet_GridFlt &)
        GridModeType GridMode() const 
        const _AtomMask& CenterMask() const 
        float Increment() const 
