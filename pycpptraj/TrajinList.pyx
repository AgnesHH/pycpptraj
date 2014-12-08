# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Trajin cimport Trajin


cdef class TrajinList:
    def __cinit__(self):
        self.thisptr = new _TrajinList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def SetDebug(self,int dIn):
        self.thisptr.SetDebug(dIn)

    def AddTrajin(self, string fname, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddTrajin(fname, arglist.thisptr[0], toplist.thisptr[0])

    def AddEnsemble(self, string s, ArgList arglist, TopologyList toplist):
        return self.thisptr.AddEnsemble(s, arglist.thisptr[0], toplist.thisptr[0])

    def __iter__(self):
        # STATUS: got Segmentation fault (core dumped)
        # Trajin has abtract methods --> can not create instance. 
        cdef Trajin trajin
        cdef cppvector[_Trajin*].const_iterator it
        it = self.thisptr.begin()
        while it != self.thisptr.end():
            trajin = Trajin()
            trajin.thisptr[0] = deref(deref(it))
            yield trajin
            incr(it)

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

        cdef Trajin trajin = Trajin()
        trajin.thisptr[0] = deref(self.thisptr.front())
        return trajin


    @property
    def max_frames(self):
        return self.thisptr.MaxFrames()

    def List(self):
        self.thisptr.List()
