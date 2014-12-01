# distutils: language = c++
from CpptrajState cimport *
from ArgList cimport *
from DispatchObject cimport *


cdef extern from "Command.h": 
    ctypedef enum RetType "Command::RetType":
        C_OK "Command::C_OK"
        C_ERR "Command::C_ERR"
        C_QUIT "Command::C_QUIT"
    ctypedef enum CommandType "Command::CommandType":
        NONE "Command::NONE"
        PARM "Command::PARM"
        TRAJ "Command::TRAJ"
        ACTION "Command::ACTION"
        ANALYSIS "Command::ANALYSIS"
        GENERAL "Command::GENERAL"
        DEPRECATED "Command::DEPRECATED"
    #ctypedef DispatchAllocatorType AllocType
    #ctypedef RetType (*CommandFxnType)(_CpptrajState&, _ArgList&, _AllocType)
    #ctypedef (*CommandHelpType)()
    #ctypedef const char* CommandKeywordType
    ctypedef struct Token:
        pass
        #CommandType Type
        #CommandKeywordType Cmd
        #AllocType Alloc
        #CommandHelpType Help
        #CommandFxnType Fxn
    ctypedef Token* TokenPtr
    cdef cppclass _Command "Command":
        void ListCommands(CommandType)
        TokenPtr SearchTokenType(_CommandType, const _ArgList& argIn)
        TokenPtr SearchToken(_ArgList&)
        RetType Dispatch(_CpptrajState&, const string&)
        RetType ProcessInput(_CpptrajState&, const string&)
        const Token& CmdToken(int idx)
