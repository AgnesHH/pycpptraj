# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from Trajin cimport Trajin


cdef class TrajinList:
    def __cinit__(self):
        self.thisptr = new _TrajinList()
        self.py_free_mem = True

    def __dealloc__(self):
        if self.py_free_mem:
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
            # use memoryview rather making instance copy
            trajin.baseptr_1 = deref(it)
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
        # TODO: add doc
        cdef Trajin trajin = Trajin()
        trajin.baseptr_1 = <_Trajin*> self.thisptr.front()
        return trajin

    @property
    def max_frames(self):
        return self.thisptr.MaxFrames()

    def list(self):
        self.thisptr.List()
