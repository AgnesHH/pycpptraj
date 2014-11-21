# distutils: language = c++
from libcpp.string cimport string


cdef extern from "Range.h": 
    cdef cppclass Range "Range":
        Range() 
        Range(const string&)
        Range(const string&, int)
        Range(const Range&)
        #Range& operator =(const Range&)
        #const_iterator begin() const 
        #const_iterator end() const 
        bint Empty() const 
        int Size() const 
        int SetRange(const string&)
        int SetRange(int, int)
        const char * RangeArg() const 
        void PrintRange(const char *, int) const 
        void ShiftBy(int)
        void AddToRange(int)
        void RemoveFromRange(int)
        bint InRange(int) const 
