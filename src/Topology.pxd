from libcpp.string cimport string as string
from FileName cimport FileName
from Frame cimport Frame

cdef extern from "Topology.h":
    cdef cppclass Topology: 
        void SetOffset(double)
        void SetDebug(int)
        void SetIpol(int)
        void SetPindex(int)
        void IncreaseFrames(int)
        void SetTag(string)
        void SetVelInfo(bint)
        void SetNrepDim(int)
        void SetGBradiiSet(string, FileName)
        void SetReferenceCoords(Frame)

        string Tag()
        int Ipol()
        int Pindex()
        int Natom()
        int Nres()
        int Nmol()
        int Nsolvent()
        int Nframes()
        int NextraPts()
        bint HasVelInfo()
        int NrepDim()
        string ParmName()
        FileName OriginalFilename()
        string GBradiiSet()
        bint NoRefCoords()
        int FinalSoluteRes()
        char *c_str()
        #atom_iterator begin()
        #atom_iterator end()
        
