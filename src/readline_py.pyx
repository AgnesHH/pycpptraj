# distutils: language = c++

cdef extern from "ReadLine.h":
    cdef cppclass ReadLine:
        ReadLine()
        int GetInput()
        bint YesNoPrompt(char *)
        const char* c_str()
        bint empty()

cdef class ReadLine_py:
    cdef ReadLine *thisptr

    def __cinit__(self):
        self.thisptr = new ReadLine()

    def GetInput_py(self):
        self.thisptr.GetInput()

    def YesNoPrompt_py(self, mystring):
        return self.thisptr.YesNoPrompt(mystring)

    def c_str_py(self):
        return self.thisptr.c_str()

    def empty_py(self):
        return self.thisptr.empty()
