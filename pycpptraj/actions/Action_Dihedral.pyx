# distutils: language = c++
from cython.operator cimport dereference as deref
#from FunctPtr cimport FunctPtr


cdef class Action_Dihedral (Action):
    def __cinit__(self):
        self.thisptr = <_Action*> new _Action_Dihedral()
        self.ptr = <_Action_Dihedral*> self.thisptr

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def alloc(self):
        """return a function-pointer object to be used with ActionList class
        """
        cdef FunctPtr func = FunctPtr()
        func.ptr = &(self.ptr.Alloc)
        return func

    def help(self):
        self.ptr.Help()
