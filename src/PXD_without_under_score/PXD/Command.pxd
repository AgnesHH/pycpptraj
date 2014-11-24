# distutils: language = c++
from libcpp.string cimport string
from CpptrajState cimport *
from ArgList cimport *
from DispatchObject cimport *


cdef extern from "Command.h": 
    cdef cppclass Command::Token "Command::Token":
    # Command.h
    ctypedef enum RetType "Command::RetType":
        C_OK "Command::C_OK"
        C_ERR "Command::C_ERR"
        C_QUIT "Command::C_QUIT"
    # Command.h
    ctypedef enum CommandType "Command::CommandType":
        NONE "Command::NONE"
        PARM "Command::PARM"
        TRAJ "Command::TRAJ"
        ACTION "Command::ACTION"
        ANALYSIS "Command::ANALYSIS"
        GENERAL "Command::GENERAL"
        DEPRECATED "Command::DEPRECATED"
    cdef cppclass Command "Command":
        void ListCommands(CommandType)
        TokenPtr SearchTokenType(CommandType, const ArgList& argIn)
        TokenPtr SearchToken(ArgList&)
        RetType Dispatch(CpptrajState&, const string&)
        RetType ProcessInput(CpptrajState&, const string&)
        const Token& CmdToken(int idx)
