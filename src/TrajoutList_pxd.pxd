cdef extern from "TrajoutList.h":
    cdef cppclass _TrajoutList "TrajoutList":
        void Clear()
        void SetDebug(int)
        int AddEnsembleTrajout(ArgList, TopologyList, int)
        int AddTrajout(ArgList, TopologyList)
        #int WriteTrajout(int, Topology*, Frame*)
        void CloseTrajout()
        void List()
        bint Empty()
        #ctypedef vector<ArgList> ArgsArray
        #ctypedef vector<ArgsArray::const_iterator ArgIt

