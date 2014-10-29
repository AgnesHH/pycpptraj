# distutils: language = c++
from libcpp.string cimport string
from ReplicaDimArray cimport *

cdef enum NCTYPE: NC_UNKNOWN = 0, NC_AMBERTRAJ, NC_AMBERRESTART

cdef extern from "NetcdfFile.h":
    cdef cppclass NetcdfFile:
        NetcdfFile()
        NetcdfDebug()
        string GetAttrText(char *)

cdef void main():
    cdef NetcdfFile * mynetcdf = new NetcdfFile()
    print mynetcdf.NetcdfDebug()

main()
