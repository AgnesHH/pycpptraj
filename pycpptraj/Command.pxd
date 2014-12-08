# distutils: language = c++
from CpptrajState cimport *
from ArgList cimport *
from DispatchObject cimport *


ctypedef DispatchAllocatorType AllocType
ctypedef Token* TokenPtr
ctypedef RetType (*CommandFxnType)(_CpptrajState&, _ArgList&, AllocType)
ctypedef void (*CommandHelpType)()
ctypedef const char* CommandKeywordType
ctypedef struct Token:
    CommandType Type
    CommandKeywordType Cmd
    AllocType Alloc
    CommandHelpType Help
    CommandFxnType Fxn

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
    #ctypedef RetType (*CommandFxnType)(_CpptrajState&, _ArgList&, AllocType)
    #ctypedef void (*CommandHelpType)()
    #ctypedef const char* CommandKeywordType
    #ctypedef struct Token:
    #    CommandType Type
    #    CommandKeywordType Cmd
    #    AllocType Alloc
    #    CommandHelpType Help
    #    CommandFxnType Fxn
    #ctypedef Token* TokenPtr
    cdef cppclass _Command "Command":
        void ListCommands(CommandType)
        TokenPtr SearchTokenType(_CommandType, const _ArgList& argIn)
        TokenPtr SearchToken(_ArgList&)
        RetType Dispatch(_CpptrajState&, const string&)
        RetType ProcessInput(_CpptrajState&, const string&)
        const Token& CmdToken(int idx)

cdef class Command:
    cdef _Command* thisptr
    #cdef const Token& CmdToken(self, int idx)
