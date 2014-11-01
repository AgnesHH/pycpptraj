import ctypes as ct

NETCDFDIR='/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/lib/'
CPPTRAJDIR='/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/'
netlib = ct.cdll.LoadLibrary(NETCDFDIR+'libnetcdf.so.7')
cpptraj = ct.cdll.LoadLibrary(CPPTRAJDIR+'libcpptraj.so')

p = cpptraj.Program()
