# distutils: language = c++

# need to check if cpptraj updates new enum values

def get_key(value, dict Dict):
    """return the first key having Dict[key] == value"""
    for key, v in Dict.iteritems():
        if v == value:
            return key

# Below are dictionary for cpptraj files/types, ...
# Traj_PDBfile
#from Traj_PDBfile cimport *
cdef dict PDBWRITEMODEDict = {
    "NONE" : NONE, 
    "SINGLE" : SINGLE, 
    "MODEL" : MODEL, 
    "MULTI" : MULTI, 
    }
# CpptrajFile
#from CpptrajFile cimport *
AccessDict = {
    "READ" : READ, 
    "WRITE" : WRITE, 
    "APPEND" : APPEND, 
    "UPDATE" : UPDATE, 
    }

CompressDict = {
    "NO_COMPRESSION" : NO_COMPRESSION, 
    "GZIP" : GZIP, 
    "BZIP2" : BZIP2, 
    "ZIP" : ZIP, 
    }

FileDict = {
    "UNKNOWN_TYPE" : UNKNOWN_TYPE, 
    "STANDARD" : STANDARD, 
    "GZIPFILE" : GZIPFILE, 
    "BZIP2FILE" : BZIP2FILE, 
    "ZIPFILE" : ZIPFILE, 
    "MPIFILE" : MPIFILE, 
    }

# MaskToken
#from MaskToken cimport *
MaskTokenDict = {
    "OP_NONE" : OP_NONE, 
    "ResNum" : ResNum, 
    "ResName" : ResName, 
    "AtomNum" : AtomNum, 
    "AtomName" : AtomName, 
    "AtomType" : AtomType, 
    "AtomElement" : AtomElement, 
    "SelectAll" : SelectAll, 
    "OP_AND" : OP_AND, 
    "OP_OR" : OP_OR, 
    "OP_NEG" : OP_NEG, 
    "OP_DIST" : OP_DIST, 
    }

# Atom
#from Atom cimport *
AtomicElementDict = {
    "UNKNOWN_ELEMENT" : UNKNOWN_ELEMENT, 
    "HYDROGEN" : HYDROGEN, 
    "BORON" : BORON, 
    "CARBON" : CARBON, 
    "NITROGEN" : NITROGEN, 
    "OXYGEN" : OXYGEN, 
    "FLUORINE" : FLUORINE, 
    "PHOSPHORUS" : PHOSPHORUS, 
    "SULFUR" : SULFUR, 
    "CHLORINE" : CHLORINE, 
    "BROMINE" : BROMINE, 
    "IRON" : IRON, 
    "CALCIUM" : CALCIUM, 
    "IODINE" : IODINE, 
    "MAGNESIUM" : MAGNESIUM, 
    "COPPER" : COPPER, 
    "LITHIUM" : LITHIUM, 
    "POTASSIUM" : POTASSIUM, 
    "RUBIDIUM" : RUBIDIUM, 
    "CESIUM" : CESIUM, 
    "ZINC" : ZINC, 
    "SODIUM" : SODIUM, 
    "ALUMINUM" : ALUMINUM, 
    "ARGON" : ARGON, 
    "ARSENIC" : ARSENIC, 
    "SILVER" : SILVER, 
    "GOLD" : GOLD, 
    "ASTATINE" : ASTATINE, 
    "BERYLLIUM" : BERYLLIUM, 
    "BARIUM" : BARIUM, 
    "BISMUTH" : BISMUTH, 
    "CHROMIUM" : CHROMIUM, 
    "COBALT" : COBALT, 
    "CADMIUM" : CADMIUM, 
    "FRANCIUM" : FRANCIUM, 
    "GALLIUM" : GALLIUM, 
    "GERMANIUM" : GERMANIUM, 
    "HELIUM" : HELIUM, 
    "HAFNIUM" : HAFNIUM, 
    "MERCURY" : MERCURY, 
    "INDIUM" : INDIUM, 
    "IRIDIUM" : IRIDIUM, 
    "KRYPTON" : KRYPTON, 
    "MANGANESE" : MANGANESE, 
    "MOLYBDENUM" : MOLYBDENUM, 
    "NEON" : NEON, 
    "NICKEL" : NICKEL, 
    "NIOBIUM" : NIOBIUM, 
    "OSMIUM" : OSMIUM, 
    "PALLADIUM" : PALLADIUM, 
    "PLATINUM" : PLATINUM, 
    "LEAD" : LEAD, 
    "POLONIUM" : POLONIUM, 
    "RUTHENIUM" : RUTHENIUM, 
    "RHODIUM" : RHODIUM, 
    "RHENIUM" : RHENIUM, 
    "RADON" : RADON, 
    "RADIUM" : RADIUM, 
    "SILICON" : SILICON, 
    "SCANDIUM" : SCANDIUM, 
    "SELENIUM" : SELENIUM, 
    "STRONTIUM" : STRONTIUM, 
    "TIN" : TIN, 
    "ANTIMONY" : ANTIMONY, 
    "TITANIUM" : TITANIUM, 
    "TECHNETIUM" : TECHNETIUM, 
    "TELLURIUM" : TELLURIUM, 
    "TANTALUM" : TANTALUM, 
    "THALLIUM" : THALLIUM, 
    "VANADIUM" : VANADIUM, 
    "TUNGSTEN" : TUNGSTEN, 
    "XENON" : XENON, 
    "ZIRCONIUM" : ZIRCONIUM, 
    "YTTRIUM" : YTTRIUM, 
    "LUTETIUM" : LUTETIUM, 
    "EXTRAPT" : EXTRAPT, 
    }

# Traj_Mol2File
#from Traj_Mol2File cimport *
MOL2WRITEMODEDict = {
    "NONE" : NONE, 
    "SINGLE" : SINGLE, 
    "MOL" : MOL, 
    "MULTI" : MULTI, 
    }

# DataFile
#from DataFile cimport *
DataFormatDict = {
    "DATAFILE" : DATAFILE, 
    "XMGRACE" : XMGRACE, 
    "GNUPLOT" : GNUPLOT, 
    "XPLOR" : XPLOR, 
    "OPENDX" : OPENDX, 
    "REMLOG" : REMLOG, 
    "MDOUT" : MDOUT, 
    "EVECS" : EVECS, 
    "UNKNOWN_DATA" : UNKNOWN_DATA, 
    }
# Analysis_Hist
##from Analysis_Hist.Analysis_Hist cimport *
#NormModeDict = {
#    "NO_NORM" : NO_NORM, 
#    "NORM_SUM" : NORM_SUM, 
#    "NORM_INT" : NORM_INT, 
#    }

# Cluster_HierAgglo
#from Cluster_HierAgglo cimport *
LINKAGETYPEDict = {
    "SINGLELINK" : SINGLELINK, 
    "AVERAGELINK" : AVERAGELINK, 
    "COMPLETELINK" : COMPLETELINK, 
    }

# Mol2File
#from Mol2File cimport *
TRIPOSTAGDict = {
    "MOLECULE" : MOLECULE, 
    "ATOM" : ATOM, 
    "BOND" : BOND, 
    "SUBSTRUCT" : SUBSTRUCT, 
    }

# ReplicaDimArray
#from ReplicaDimArray cimport *
RemDimDict = {
    "UNKNOWN" : UNKNOWN, 
    "TEMPERATURE" : TEMPERATURE, 
    "PARTIAL" : PARTIAL, 
    "HAMILTONIAN" : HAMILTONIAN, 
    "PH" : PH, 
    }

# Box
#from Box cimport *
BoxDict = {
    "NOBOX" : NOBOX, 
    "ORTHO" : ORTHO, 
    "TRUNCOCT" : TRUNCOCT, 
    "RHOMBIC" : RHOMBIC, 
    "NONORTHO" : NONORTHO, 
    }

# TrajectoryFile
#from TrajectoryFile cimport *
TrajFormatDict = {
    "AMBERNETCDF" : AMBERNETCDF, 
    "AMBERRESTARTNC" : AMBERRESTARTNC, 
    "PDBFILE" : PDBFILE, 
    "MOL2FILE" : MOL2FILE, 
    "CIF" : CIF, 
    "CHARMMDCD" : CHARMMDCD, 
    "GMXTRX" : GMXTRX, 
    "BINPOS" : BINPOS, 
    "AMBERRESTART" : AMBERRESTART, 
    "AMBERTRAJ" : AMBERTRAJ, 
    "SQM" : SQM, 
    "SDF" : SDF, 
    "CONFLIB" : CONFLIB, 
    "UNKNOWN_TRAJ" : UNKNOWN_TRAJ, 
    }

# NetcdfFile
##from NetcdfFile cimport *
#NCTYPEDict = {
#    "NC_UNKNOWN" : NC_UNKNOWN, 
#    "NC_AMBERTRAJ" : NC_AMBERTRAJ, 
#    "NC_AMBERRESTART" : NC_AMBERRESTART, 
#    }
# Dimension
##from Dimension cimport *
#DimIdxDict = {
#    "X" : X, 
#    "Y" : Y, 
#    "Z" : Z, 
#    }

# DataSet.h
##from DataSet cimport *
#from .DataSet cimport (UNKNOWN_DATA, DOUBLE, FLOAT, INTEGER, STRING, MATRIX_DBL, MATRIX_FLT,
#                       COORDS, VECTOR, MODES, GRID_FLT, REMLOG, XYMESH, TRAJ)
DataTypeDict = {
        "UNKNOWN_DATA " : UNKNOWN_DATA,  
        "DOUBLE" : DOUBLE, 
        "FLOAT" : FLOAT,
        "INTEGER" : INTEGER,
        "STRING" : STRING, 
        "MATRIX_DBL" : MATRIX_DBL, 
        "MATRIX_FLT" : MATRIX_FLT,
        "COORDS" : COORDS, 
        "VECTOR" : VECTOR,
        "MODES" : MODES,
        "GRID_FLT" : GRID_FLT,
        "REMLOG" : REMLOG, 
        "XYMESH" : XYMESH, 
        "TRAJ" : TRAJ, 
    }
# DataSet_2D
#from DataSet_2D cimport *
MatrixDict = {
    "NO_OP" : NO_OP, 
    "DIST" : DIST, 
    "COVAR" : COVAR, 
    "MWCOVAR" : MWCOVAR, 
    "CORREL" : CORREL, 
    "DISTCOVAR" : DISTCOVAR, 
    "IDEA" : IDEA, 
    "IRED" : IRED, 
    "DIHCOVAR" : DIHCOVAR, 
    "NMAT" : NMAT, 
    }

MatrixKindDict = {
    "FULL" : FULL, 
    "HALF" : HALF, 
    "TRI" : TRI, 
    }

## ClusterSieve
##from ClusterSieve cimport *
#SieveDict = {
#    "NONE" : NONE, 
#    "REGULAR" : REGULAR, 
#    "RANDOM" : RANDOM, 
#    }

# PDBfile
#from PDBfile cimport *
PDB_RECTYPEDict = {
    "ATOM" : ATOM, 
    "HETATM" : HETATM, 
    "CRYST1" : CRYST1, 
    "TER" : TER, 
    "END" : END, 
    "ANISOU" : ANISOU, 
    "END_OF_FILE" : END_OF_FILE, 
    "UNKNOWN" : UNKNOWN, 
    }

# Action
##from actions.Action cimport RetDict
##from actions.Action cimport OK, ERR as A_OK, A_ERR  
##from actions.Action cimport USEORIGINALFRAME, SUPPRESSCOORDOUTPUT as A_USEORIGINALFRAME, A_SUPPRESSCOORDOUTPUT
#from actions cimport Action

RetDict = {
    "OK" : OK, 
    "ERR" : ERR, 
    "USEORIGINALFRAME" : USEORIGINALFRAME, 
    "SUPPRESSCOORDOUTPUT" : SUPPRESSCOORDOUTPUT, 
    }

# Frame
# not in cpptraj Frame.h anymore
##from Frame cimport *
#CenterModeDict = {
#    "ORIGIN" : ORIGIN, 
#    "BOXCTR" : BOXCTR, 
#    "POINT" : POINT, 
#    }

# ParmFile
#from ParmFile cimport *
ParmFormatDict= {
        AMBERPARM : "AMBERPARM",
        PDBFILE : "PDBFILE",
        MOL2FILE : "MOL2FILE",
        CHARMMPSF : "CHARMMPSF",
        CIFFILE : "CIFFILE",
        GMXTOP : "GMXTOP",
        SDFFILE : "SDFFILE",
        TINKER : "TINKER",
        UNKNOWN_PARM : "UNKNOWN_PARM",
}

# ClusterList
#from ClusterList cimport *
DistModeDict = {
    "USE_FRAMES" : USE_FRAMES, 
    "USE_FILE" : USE_FILE, 
    }

# ClusterList
#from ClusterList cimport *
DistMetricDict = {
    "RMS" : RMS, 
    "DME" : DME, 
    "SRMSD" : SRMSD, 
    "DATA" : DATA, 
    }
# GridAction
##from GridAction cimport *
GridModeDict = {
    "ORIGIN" : ORIGIN, 
    "BOX" : BOX, 
    "MASKCENTER" : MASKCENTER, 
    "SPECIFIEDCENTER" : SPECIFIEDCENTER, 
    }

# Trajin_Multi
#from Trajin_Multi cimport *
TargetDict = {
    "NONE" : NONE, 
    "TEMP" : TEMP, 
    "INDICES" : INDICES, 
    "CRDIDX" : CRDIDX, 
    }

# TrajinList
#from TrajinList cimport *
TrajModeDict = {
    "UNDEFINED" : UNDEFINED, 
    "NORMAL" : NORMAL, 
    "ENSEMBLE" : ENSEMBLE, 
    }

# Analysis
###from Analysis cimport *
#RetDict = {
#    "OK" : OK, 
#    "ERR" : ERR, 
#    }
