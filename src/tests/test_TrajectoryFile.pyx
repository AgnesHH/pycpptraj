# distutils: language = c++

from TrajectoryFile cimport *

cdef _TrajectoryFile* p = new _TrajectoryFile()

p.ReadOptions()
print
p.WriteOptions()

del p
