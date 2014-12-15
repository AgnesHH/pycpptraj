# Traj_PDBfile.h
from Traj_PDBfile.h cimport *
PDBWRITEMODEDict = {
    "NONE" : NONE, 
    "SINGLE" : SINGLE, 
    "MODEL" : MODEL, 
    "MULTI" : MULTI, 
    }
# CpptrajFile.h
from CpptrajFile.h cimport *
AccessDict = {
    "READ" : READ, 
    "WRITE" : WRITE, 
    "APPEND" : APPEND, 
    "UPDATE" : UPDATE, 
    }
# CpptrajFile.h
from CpptrajFile.h cimport *
CompressDict = {
    "NO_COMPRESSION" : NO_COMPRESSION, 
    "GZIP" : GZIP, 
    "BZIP2" : BZIP2, 
    "ZIP" : ZIP, 
    }
# CpptrajFile.h
from CpptrajFile.h cimport *
FileDict = {
    "UNKNOWN_TYPE" : UNKNOWN_TYPE, 
    "STANDARD" : STANDARD, 
    "GZIPFILE" : GZIPFILE, 
    "BZIP2FILE" : BZIP2FILE, 
    "ZIPFILE" : ZIPFILE, 
    "MPIFILE" : MPIFILE, 
    }
# MaskToken.h
from MaskToken.h cimport *
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
# Atom.h
from Atom.h cimport *
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
# Traj_Mol2File.h
from Traj_Mol2File.h cimport *
MOL2WRITEMODEDict = {
    "NONE" : NONE, 
    "SINGLE" : SINGLE, 
    "MOL" : MOL, 
    "MULTI" : MULTI, 
    }
# DataFile.h
from DataFile.h cimport *
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
# Analysis_Hist.h
from Analysis_Hist.h cimport *
NormModeDict = {
    "NO_NORM" : NO_NORM, 
    "NORM_SUM" : NORM_SUM, 
    "NORM_INT" : NORM_INT, 
    }
# Cluster_HierAgglo.h
from Cluster_HierAgglo.h cimport *
LINKAGETYPEDict = {
    "SINGLELINK" : SINGLELINK, 
    "AVERAGELINK" : AVERAGELINK, 
    "COMPLETELINK" : COMPLETELINK, 
    }
# Mol2File.h
from Mol2File.h cimport *
TRIPOSTAGDict = {
    "MOLECULE" : MOLECULE, 
    "ATOM" : ATOM, 
    "BOND" : BOND, 
    "SUBSTRUCT" : SUBSTRUCT, 
    }
# ReplicaDimArray.h
from ReplicaDimArray.h cimport *
RemDimDict = {
    "UNKNOWN" : UNKNOWN, 
    "TEMPERATURE" : TEMPERATURE, 
    "PARTIAL" : PARTIAL, 
    "HAMILTONIAN" : HAMILTONIAN, 
    "PH" : PH, 
    }
# Box.h
from Box.h cimport *
BoxDict = {
    "NOBOX" : NOBOX, 
    "ORTHO" : ORTHO, 
    "TRUNCOCT" : TRUNCOCT, 
    "RHOMBIC" : RHOMBIC, 
    "NONORTHO" : NONORTHO, 
    }
# TrajectoryFile.h
from TrajectoryFile.h cimport *
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
# NetcdfFile.h
from NetcdfFile.h cimport *
NCTYPEDict = {
    "NC_UNKNOWN" : NC_UNKNOWN, 
    "NC_AMBERTRAJ" : NC_AMBERTRAJ, 
    "NC_AMBERRESTART" : NC_AMBERRESTART, 
    }
[1430] WARN unresolved _iterator
# Dimension.h
from Dimension.h cimport *
DimIdxDict = {
    "X" : X, 
    "Y" : Y, 
    "Z" : Z, 
    }
# DataSet_2D.h
from DataSet_2D.h cimport *
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
# DataSet_2D.h
from DataSet_2D.h cimport *
MatrixKindDict = {
    "FULL" : FULL, 
    "HALF" : HALF, 
    "TRI" : TRI, 
    }
# ClusterSieve.h
from ClusterSieve.h cimport *
SieveDict = {
    "NONE" : NONE, 
    "REGULAR" : REGULAR, 
    "RANDOM" : RANDOM, 
    }
# PDBfile.h
from PDBfile.h cimport *
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
# Action.h
from Action.h cimport *
RetDict = {
    "OK" : OK, 
    "ERR" : ERR, 
    "USEORIGINALFRAME" : USEORIGINALFRAME, 
    "SUPPRESSCOORDOUTPUT" : SUPPRESSCOORDOUTPUT, 
    }
# Frame.h
from Frame.h cimport *
CenterModeDict = {
    "ORIGIN" : ORIGIN, 
    "BOXCTR" : BOXCTR, 
    "POINT" : POINT, 
    }
# ParmFile.h
from ParmFile.h cimport *
ParmFormatDict = {
    "AMBERPARM" : AMBERPARM, 
    "PDBFILE" : PDBFILE, 
    "MOL2FILE" : MOL2FILE, 
    "CHARMMPSF" : CHARMMPSF, 
    "CIFFILE" : CIFFILE, 
    "SDFFILE" : SDFFILE, 
    "UNKNOWN_PARM" : UNKNOWN_PARM, 
    }
# ClusterList.h
from ClusterList.h cimport *
DistModeDict = {
    "USE_FRAMES" : USE_FRAMES, 
    "USE_FILE" : USE_FILE, 
    }
# ClusterList.h
from ClusterList.h cimport *
DistMetricDict = {
    "RMS" : RMS, 
    "DME" : DME, 
    "SRMSD" : SRMSD, 
    "DATA" : DATA, 
    }
# GridAction.h
from GridAction.h cimport *
GridModeDict = {
    "ORIGIN" : ORIGIN, 
    "BOX" : BOX, 
    "MASKCENTER" : MASKCENTER, 
    "SPECIFIEDCENTER" : SPECIFIEDCENTER, 
    }
# Trajin_Multi.h
from Trajin_Multi.h cimport *
TargetDict = {
    "NONE" : NONE, 
    "TEMP" : TEMP, 
    "INDICES" : INDICES, 
    "CRDIDX" : CRDIDX, 
    }
# TrajinList.h
from TrajinList.h cimport *
TrajModeDict = {
    "UNDEFINED" : UNDEFINED, 
    "NORMAL" : NORMAL, 
    "ENSEMBLE" : ENSEMBLE, 
    }
# Analysis.h
from Analysis.h cimport *
RetDict = {
    "OK" : OK, 
    "ERR" : ERR, 
    }
