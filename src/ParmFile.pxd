# distutil: language = c++

cdef extern from "ParmFile.h":
    ctypedef enum ParmFormatType "ParmFile::ParmFormatType":
        #man, too wordy for enum. Why not using nested enum?
        AMBERPARM "ParmFile::AMBERPARM"
        PDBFILE "ParmFile::PDBFILE"
        MOL2FILE "ParmFile::MOL2FILE"
        CHARMMPSF "ParmFile::CHARMMPSF"
        CIFFILE "ParmFile::CIFFILE"
        SDFFILE "ParmFile::SDFFILE"
        UNKNOWN_PARM "ParmFile::UNKNOWN_PARM"
    cdef cppclass _ParmFile "ParmFile":
        pass
