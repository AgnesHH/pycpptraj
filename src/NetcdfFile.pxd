from libcpp.string cimport string
from ReplicaDimArray cimport *

cdef enum NCTYPE: NC_UNKNOWN = 0, NC_AMBERTRAJ, NC_AMBERRESTART

cdef extern from "NetcdfFile.h":
    cdef cppclass NetcdfFile:
        #enum NCTYPE "NetcdfFile::NCTYPE": 
        #    NC_UNKNOWN = 0
        #    NC_AMBERTRAJ
        #    NC_AMBERRESTART
        NetcdfFile()
        NetcdfDebug()
        string GetAttrText(char *)
        NCTYPE GetNetcdfConventions()
        int NC_openRead(string &)
        int NC_openWrite(string &)
        int NC_createReservoir(bint, double, int, int&, int&)
        int NC_create(string&, NCTYPE, int, bint, bint, bint, bint, bint,
                      bint, ReplicaDimArray&, string&)
        void NC_close()

        int SetupFrame()
        int SetupCoordsVelo(bint)
        int SetupTime()
        int SetupBox(double*, NCTYPE)
        int SetupTemperature()
        int SetupMultiD(ReplicaDimArray&)

        void FloatToDouble(double*, float*)
        void DoubleToFloat(float*, double*)

        int Ncid()
        int Ncatom()
        int Ncatom3()
        int Ncframe()
        bint HasVelocities()
        bint HasCoords()

        #protected
        size_t start_[3]
        size_t count_[3]

        int ncid_
        int ncframe_
        int TempVID_
        int coordVID_
        int velocityVID_
        int frcVID_
        int cellAngleVID_
        int cellLengthVID_
        int timeVID_

        #MultiD REMD
        int remd_dimension_
        int indicesVID_
        bint checkNCerr(int)

