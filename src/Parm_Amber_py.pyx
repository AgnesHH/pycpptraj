# distutils: language = c++

cdef extern from "Parm_Amber.h":
    cdef cppclass Parm_Amber:
        void WriteHelp()

def main():
    cdef Parm_Amber *myparm = new Parm_Amber()
    myparm.WriteHelp()

