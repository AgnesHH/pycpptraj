# distutils: language = c++


cdef extern from "ReadLine.h": 
    cdef cpplass _ReadLine "ReadLine":
        _ReadLine() 
        int GetInput() 
        bint YesNoPrompt(const char *)
        const char * c_str() const 
        const string& operator *() const 
        bint empty() const 
