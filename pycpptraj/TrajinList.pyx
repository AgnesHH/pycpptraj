# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Trajin cimport Trajin


cdef class TrajinList:
    def __cinit__(self):
        self.thisptr = new _TrajinList()

    def __dealloc__(self):
        del self.thisptr

    def clear(self):
        self.thisptr.Clear()

    def set_debug(self,int dIn):
        self.thisptr.SetDebug(dIn)

    def add_trajin(self, string fname, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddTrajin(fname, arglist.thisptr[0], toplist.thisptr[0])

    def add_ensemble(self, string s, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddEnsemble(s, arglist.thisptr[0], toplist.thisptr[0])

    def __iter__(self):
        cdef Trajin trajin
        cdef cppvector[_Trajin*].const_iterator it
        it = self.thisptr.begin()
        while it != self.thisptr.end():
            trajin = Trajin()
            trajin.baseptr = deref(it)
            yield trajin
            incr(it)

    #def __next__(self):
    #    pass
        
    def empty(self):
        return self.thisptr.empty()

    def mode(self, updatedmode=False):
        # Use "updatedmode" in case Dan Roe updates his TrajinList.Mode()
        
        TrajModeType_dict = {
                UNDEFINED : "UNDEFINED",
                NORMAL : "NORMAL",
                ENSEMBLE : "ENSEMBLE",
        }

        if not updatedmode:
            return TrajModeType_dict[self.thisptr.Mode()]
        else:
            raise NotImplementedError()

    def front(self):
        # STATUS: got Segmentation fault
        # Trajin has abtract methods --> can not create instance. 
        # cpptraj: return Trajin*
        pass

        #cdef Trajin trajin = Trajin()
        #trajin.thisptr[0] = deref(<_Trajin*> self.thisptr.front())
        #return trajin


    @property
    def max_frames(self):
        return self.thisptr.MaxFrames()

    def list(self):
        self.thisptr.List()
