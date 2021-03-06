# distutils: language = c++
import StringIO
from cython.operator cimport dereference as deref


cdef class Action_Rmsd (Action):
    def __cinit__(self):
        self.baseptr = <_Action*> new _Action_Rmsd()
        self.thisptr = <_Action_Rmsd*> self.baseptr

    def __str__(self):
        return self.help()

    def __dealloc__(self):
        if self.baseptr is not NULL:
            del self.baseptr

    def alloc(self):
        """return a function-pointer object to be used with ActionList class
        """
        cdef FunctPtr func = FunctPtr()
        func.ptr = &(self.thisptr.Alloc)
        return func
