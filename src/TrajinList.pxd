# distutil: language = c++

from libcpp.string cimport string
from Trajin cimport Trajin
from TopologyList cimport TopologyList

cdef extern from "TrajinList.h":
    ctypedef enum TrajModeType: UNDEFINED, NORMAL, ENSEMBLE
    cdef cppclass TrajinList:
        #enum
        TrajinList()
        void Clear()
        void SetDebug(int)
        int AddTrajin(string&, ArgList&, TrajinList&)
        int AddEnsemble(string&, ArgList&, TopologyList&)

        ctypedef vector[Trajin*] ListType
        ctypedef ListType.const_iterator const_iterator
        const_iterator begin()
        const_iterator end()
        bint empty()
        TrajModeType Mode()
        Trajin* front()
        int MaxFrames()
        void List()
