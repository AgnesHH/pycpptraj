# distutils: language = c++
from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "ArgList.h": 
    cdef cppclass _ArgList "ArgList":
        _ArgList ()
        _ArgList(const char *)
        _ArgList(const string&)
        _ArgList(const string&, const char *)
        _ArgList(const _ArgList &)
        #_ArgList & operator =(const _ArgList &)
        const string& operator [ ](int)const 
        const vector [string]& List ()const 
        #const_iterator begin ()const 
        #const_iterator end ()const 
        int Nargs ()const 
        bint empty ()const 
        const char * ArgLine ()const 
        void ClearList ()
        int SetList(const string&, const char *)
        _ArgList RemainingArgs ()
        void AddArg(const string&)
        void MarkArg(int)
        bint CheckForMoreArgs ()const 
        void PrintList ()const 
        void PrintDebug ()const 
        void RemoveFirstArg ()
        const char * _Command ()const 
        bint _CommandIs(const char *)const 
        const string& GetStringNext ()
        const string& GetMaskNext ()
        const string& getNextTag ()
        bint ValidInteger(int)const 
        int IntegerAt(int)const 
        bint ValidDouble(int)const 
        int getNextInteger(int)
        double getNextDouble(double)
        const string& GetStringKey(const char *)
        int getKeyInt(const char *, int)
        double getKeyDouble(const char *, double)
        bint hasKey(const char *)
        bint Contains(const char *)const 
