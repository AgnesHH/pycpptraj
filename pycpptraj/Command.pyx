# distutils: language = c++


cdef class Command:
    def __cinit__(self):
        self.thisptr = new _Command()

    def __dealloc__(self):
        del self.thisptr

    def mode(self, cmmode='RetType'):
        RetType = {
                "C_OK" : C_OK,
                "C_ERR" : C_ERR,
                "C_QUIT" : C_QUIT,
        }

        CommandType = {
                "NONE" : NONE,
                "PARM" : PARM,
                "TRAJ" : TRAJ,
                "ACTION" : ACTION,
                "ANALYSIS" : ANALYSIS,
                "GENERAL" : GENERAL,
                "DEPRECATED" : DEPRECATED,
        }

        if cmmode == 'RetType':
            return RetType
        elif cmmode == 'CommandType':
            return CommandType

    def ListCommands(self, cmtype=None):
        self.thisptr.ListCommands(self.mode('CommandType')[cmtype])

    #def TokenPtr SearchTokenType(self,CommandType cmmode, ArgList argIn):

    #def TokenPtr SearchToken(self,ArgList):

    def Dispatch(self, CpptrajState state, string cmdin):
        return self.thisptr.Dispatch(state.thisptr[0], cmdin)

    def ProcessInput(self,CpptrajState cppstate, string fnameIn):
        ret = self.thisptr.ProcessInput(cppstate.thisptr[0], fnameIn)
        for key in self.mode('RetType').keys():
            if self.mode('RetType')[key] == ret:
                return key
            
    #cdef Token&& CmdToken(self, int idx):
    #    return self.thisptr.CmdToken(idx)
