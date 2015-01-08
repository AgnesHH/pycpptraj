# distutils: language = c++

cdef extern from "netcdf.h":
    nc_close(int ncid)
    nc_open(const char *path, int mode, int *ncidp)
