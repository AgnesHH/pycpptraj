# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class Action_Rmsd (Action):
    def __cinit__(self):
        self.thisptr = <_Action*> new _Action_Rmsd()
        self.ptr = <_Action_Rmsd*> self.thisptr

    def __dealloc__(self):
        print "bye bye"
        del self.thisptr

    def Alloc(self):
        cdef DispatchObject dpobject = DispatchObject()
        dpobject.thisptr[0] = deref(self.ptr.Alloc())
        return dpobject

    def Help(self):
        self.ptr.Help()
