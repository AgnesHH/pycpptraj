# distutils: language = c++

cdef extern from "ReadLine.h":
    char* duplicate_string(const char*)
    char* command_generator(const char*, int)
    #char** cpptraj_completion(const char*, int, int)
    cdef cppclass ReadLine:
        ReadLine()
        int GetInput()
        bint YesNoPrompt(char *)
        const char* c_str()
        bint empty()
     #char* duplicate_string(const char*)
     #char* command_generator(const char*, int)
     #char** cpptraj_completion(const char*, int, int)

cdef class ReadLine_py:
    cdef ReadLine *thisptr

    def __cinit__(self):
        self.thisptr = new ReadLine()

    def GetInput(self):
        self.thisptr.GetInput()

    def YesNoPrompt(self, mystring):
        return self.thisptr.YesNoPrompt(mystring)

    def c_str(self):
        return self.thisptr.c_str()

    def empty(self):
        return self.thisptr.empty()
