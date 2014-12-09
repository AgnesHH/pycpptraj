# distutils: language = c++

from TrajectoryFile cimport *

def main():
    cdef _TrajectoryFile* p = new _TrajectoryFile()
    
    p.ReadOptions()
    print
    p.WriteOptions()
    
    del p

main()
