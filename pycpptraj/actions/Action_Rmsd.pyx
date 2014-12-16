# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class Action_Rmsd (Action):
    def __cinit__(self):
        self.thisptr = <_Action*> new _Action_Rmsd()
        self.ptr = <_Action_Rmsd*> self.thisptr

    def __dealloc__(self):
        del self.thisptr

    @classmethod
    def alloc(cls):
        cdef DispatchObject dpobject = DispatchObject()
        dpobject.thisptr[0] = deref(self.ptr.Alloc())
        return dpobject

    @classmethod
    def help(cls):
        self.ptr.Help()
