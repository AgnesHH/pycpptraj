# distutil: language = c++ 

from Action cimport *
from ImagedAction cimport *
from ArgList cimport *

cdef extern from "Action_Distance.h":
    cdef cppclass _Action_Distance "Action_Distance":
        _Action_Distance()
        const char* NOE_Help
        void Help()
        int NOE_Args(_ArgList&, double&, double&, double&)
