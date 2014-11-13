# distutils: language = c++

from Traj_AmberRestartNC cimport *

cdef _Traj_AmberRestartNC* p = new _Traj_AmberRestartNC()

del p
