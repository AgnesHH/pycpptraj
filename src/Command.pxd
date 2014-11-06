# distutil: language = c++

from libcpp.string cimport string
from ArgList cimport *
from CpptrajState cimport *

cdef extern from "Command.h":
    ctypedef _RetType "Command::RetType"
    ctypedef _CommandType "Command::CommandType"
    ctypedef struct Token "Command::Token":
        pass
        #CommandType Type
        #CommandKeywordType Cmd 
        #AllocType Alloc 
        #CommandHelpType Help 
        #CommandFxnType Fxn
    cdef cppclass _Command "Command":
       void ListCommands(_CommandType) 
       Token* SearchTokenType(_CommandType, const _ArgList&)
       Token* SearchToken(_ArgList&)
       _RetType Dispatch(_CpptrajState&, const string&)
       _RetType ProcessInput(_CpptrajState&, const string&)
       const Token& CmdToken(int) 

cdef class Command:
    cdef _Command* thisptr
