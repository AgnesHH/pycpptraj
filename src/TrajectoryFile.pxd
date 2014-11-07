# distutil: language = c++

cdef extern from "TrajectoryFile.h":
    ctypedef enum TrajFormatType "TrajectoryFile::TrajFormatType":
        pass
    cdef cppclass _TrajectoryFile "TrajectoryFile":
        pass
