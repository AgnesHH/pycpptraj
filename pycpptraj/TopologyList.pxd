# distutil: language = c++
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *
from Pycpptraj_exception import topology_error

cdef extern from "TopologyList.h":
    cdef cppclass _TopologyList "TopologyList":
        const char* ParmArgs
        TopologyList()
        void Clear()
        void SetDebug(int)
        _Topology* GetParm(int) except +IndexError
        _Topology* GetParmByIndex(_ArgList&) except +IndexError
        _Topology* GetParm(_ArgList&) except +IndexError
        int AddParmFile(string&)
        int AddParmFile(string&, _ArgList&)
        void AddParm(_Topology * pIn)
        void List()

cdef class TopologyList:
    cdef _TopologyList* thisptr
    cdef bint py_free_mem
