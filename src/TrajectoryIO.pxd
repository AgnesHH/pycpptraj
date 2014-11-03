# distutil: language = c++

cdef extern from "TrajectoryIO.h":
    cdef cppclass _TrajectoryIO "TrajectoryIO":
        pass
