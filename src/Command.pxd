# distutil: language = c++

from ArgList cimport *
from CpptrajState cimport *

cdef extern from "Command.h":
    cdef _RetType "Command::RetType"
    cdef _CommandType "Command::CommandType"
    cdef Tokentmp "Command::Token" 
    ctypedef Tokentmp* TokenPtr
    ctypedef struct Token "Command::Token":
        pass
        #CommandType Type
        #CommandKeywordType Cmd 
        #AllocType Alloc 
        #CommandHelpType Help 
        #CommandFxnType Fxn
    cdef cppclass _Command "Command":
       void ListCommands(_CommandType) 
       TokenPtr SearchTokenType(_CommandType, const _ArgList&)
       TokenPtr SearchToken(_ArgList&)
       _RetType Dispatch(_CpptrajState&, const string&)
       _RetType ProcessInput(_CpptrajState&, const string&)
       const Token& CmdToken(int) 

cdef class Command:
    cdef _Command* thisptr
