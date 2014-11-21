# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string


cdef extern from "ArgList.h": 
    cdef cppclass ArgList "ArgList":
        ArgList() 
        ArgList(const char *)
        ArgList(const string&)
        ArgList(const string&, const char *)
        ArgList(const ArgList&)
        #ArgList& operator =(const ArgList&)
        const string& operator[](int) const 
        const vector[string]& List() const 
        #const_iterator begin() const 
        #const_iterator end() const 
        int Nargs() const 
        bint empty() const 
        const char * ArgLine() const 
        void ClearList() 
        int SetList(const string&, const char *)
        ArgList RemainingArgs() 
        void AddArg(const string&)
        void MarkArg(int)
        bint CheckForMoreArgs() const 
        void PrintList() const 
        void PrintDebug() const 
        void RemoveFirstArg() 
        const char * Command() const 
        bint CommandIs(const char *) const 
        const string& GetStringNext() 
        const string& GetMaskNext() 
        const string& getNextTag() 
        bint ValidInteger(int) const 
        int IntegerAt(int) const 
        bint ValidDouble(int) const 
        int getNextInteger(int)
        double getNextDouble(double)
        const string& GetStringKey(const char *)
        int getKeyInt(const char *, int)
        double getKeyDouble(const char *, double)
        bint hasKey(const char *)
        bint Contains(const char *) const 
