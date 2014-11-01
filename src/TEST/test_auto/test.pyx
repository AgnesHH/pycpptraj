#cython: c_string_encoding=ascii  # for cython>=0.19
from  libcpp.string  cimport string as libcpp_string
from  libcpp.set     cimport set as libcpp_set
from  libcpp.vector  cimport vector as libcpp_vector
from  libcpp.pair    cimport pair as libcpp_pair
from  libcpp.map     cimport map  as libcpp_map
from  smart_ptr cimport shared_ptr
from  AutowrapRefHolder cimport AutowrapRefHolder
from  libcpp cimport bool
from  libc.string cimport const_char
from cython.operator cimport dereference as deref, preincrement as inc, address as address
from AtomMap cimport AtomMap as _AtomMap
cdef extern from "autowrap_tools.hpp":
    char * _cast_const_away(char *) 

cdef class AtomMap:

    cdef shared_ptr[_AtomMap] inst

    def __dealloc__(self):
         self.inst.reset()

    
    def __init__(self):
        self.inst = shared_ptr[_AtomMap](new _AtomMap())
    
    def CheckBonds(self):
        cdef int _r = self.inst.get().CheckBonds()
        py_result = <int>_r
        return py_result
    
    def CheckForCompleteAtoms(self):
        self.inst.get().CheckForCompleteAtoms()
    
    def MarkAtomComplete(self,  in_0 ,  in_1 ):
        assert isinstance(in_0, (int, long)), 'arg in_0 wrong type'
        assert isinstance(in_1, (int, long)), 'arg in_1 wrong type'
    
    
        self.inst.get().MarkAtomComplete((<int>in_0), (<bool>in_1))
    
    def SetDebug(self,  in_0 ):
        assert isinstance(in_0, (int, long)), 'arg in_0 wrong type'
    
        self.inst.get().SetDebug((<int>in_0))
    
    def Natom(self):
        cdef int _r = self.inst.get().Natom()
        py_result = <int>_r
        return py_result
    
    def BondIsRepeated(self,  in_0 ,  in_1 ):
        assert isinstance(in_0, (int, long)), 'arg in_0 wrong type'
        assert isinstance(in_1, (int, long)), 'arg in_1 wrong type'
    
    
        cdef bool _r = self.inst.get().BondIsRepeated((<int>in_0), (<int>in_1))
        py_result = <bool>_r
        return py_result
    
    def ResetMapping(self):
        self.inst.get().ResetMapping()
    
    def DetermineAtomIDs(self):
        self.inst.get().DetermineAtomIDs() 
